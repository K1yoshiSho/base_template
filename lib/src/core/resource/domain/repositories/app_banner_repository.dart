import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/src/core/common/state/blocs/banner/app_banner_bloc.dart';

abstract interface class AppBannerRepository {
  Future<void> getAppBanner(GetAppBannerEvent event, Emitter<AppBannerState> emit);
}
