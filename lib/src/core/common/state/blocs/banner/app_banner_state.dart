part of 'app_banner_bloc.dart';

sealed class AppBannerState extends Equatable {
  const AppBannerState();

  @override
  List<Object?> get props => [AppBannerFetchedState];
}

final class AppBannerInitial extends AppBannerState {
  const AppBannerInitial();

  @override
  List<Object?> get props => [];
}

/// [Loading] states

final class AppBannerLoadingState extends AppBannerState {
  const AppBannerLoadingState();

  @override
  List<Object?> get props => [];
}

/// [Fetched] states

final class AppBannerFetchedState extends AppBannerState {
  final List<BannerModel> banners;

  const AppBannerFetchedState({
    required this.banners,
  });

  @override
  List<Object?> get props => [
        banners,
      ];
}

/// [Failure] states

final class AppBannerFailureState extends AppBannerState {
  final String error;
  final DioException? errorDio;
  const AppBannerFailureState({
    required this.error,
    this.errorDio,
  });

  @override
  List<Object?> get props => [error, errorDio];
}
