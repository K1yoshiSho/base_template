import 'package:base/src/core/common/state/blocs/banner/app_banner_bloc.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/banner.dart';
import 'package:base/src/core/resource/domain/repositories/app_banner_repository.dart';

class DataAppBannerRepository implements AppBannerRepository {
  @override
  Future<void> getAppBanner(GetAppBannerEvent event, Emitter<AppBannerState> emit) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      emit(const AppBannerLoadingState());
      final response = await HttpQuery().get(
        url: "/v2/banners/all",
        headerData: headerData,
      );
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(AppBannerFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(AppBannerFetchedState(banners: BannerModel.fromList(response)));
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(AppBannerFailureState(error: e.toString()));
    }
  }
}
