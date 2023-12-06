part of 'app_banner_bloc.dart';

sealed class AppBannerEvent extends Equatable {
  const AppBannerEvent();

  @override
  List<Object> get props => [];
}

final class GetAppBannerEvent extends AppBannerEvent {
  const GetAppBannerEvent();

  @override
  List<Object> get props => [];
}
