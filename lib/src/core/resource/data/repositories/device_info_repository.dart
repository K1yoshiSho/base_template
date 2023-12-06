import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/state/blocs/device_info/device_info_bloc.dart';
import 'package:base/src/core/resource/domain/repositories/device_info_repository.dart';

class DataDeviceInfoRepository implements DeviceInfoRepository {
  @override
  Future<void> sendDeviceInfo(SendDeviceInfoEvent event, Emitter<DeviceInfoState> emit) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      emit(const DeviceInfoLoading());
      final response = await HttpQuery().post(
        url: "/save_device",
        headerData: headerData,
        data: {},
      );
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(DeviceInfoFailureState(message: e.message ?? "", dioException: e));
      } else {
        emit(const DeviceInfoFetchedState());
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(DeviceInfoFailureState(message: e.toString()));
    }
  }
}
