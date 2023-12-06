import 'package:base/src/core/common/exports/main_export.dart';

part 'device_info_event.dart';
part 'device_info_state.dart';

class DeviceInfoBloc extends Bloc<DeviceInfoEvent, DeviceInfoState> {
  DeviceInfoBloc() : super(const DeviceInfoInitial()) {
    on<SendDeviceInfoEvent>((event, emit) async {
      await dependenciesContainer.deviceInfoRepository.sendDeviceInfo(event, emit);
    });
  }
}
