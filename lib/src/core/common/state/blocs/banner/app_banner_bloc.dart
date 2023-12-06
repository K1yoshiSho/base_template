import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/banner.dart';

part 'app_banner_event.dart';
part 'app_banner_state.dart';

class AppBannerBloc extends Bloc<AppBannerEvent, AppBannerState> {
  AppBannerBloc() : super(const AppBannerInitial()) {
    on<GetAppBannerEvent>((event, emit) async => dependenciesContainer.appBannerRepository.getAppBanner(event, emit));
  }
}
