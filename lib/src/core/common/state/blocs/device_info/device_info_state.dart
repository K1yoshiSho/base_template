part of 'device_info_bloc.dart';

sealed class DeviceInfoState extends Equatable {
  const DeviceInfoState();

  @override
  List<Object> get props => [];
}

final class DeviceInfoInitial extends DeviceInfoState {
  const DeviceInfoInitial();
}

final class DeviceInfoLoading extends DeviceInfoState {
  const DeviceInfoLoading();
}

final class DeviceInfoFetchedState extends DeviceInfoState {
  const DeviceInfoFetchedState();

  @override
  List<Object> get props => [];
}

final class DeviceInfoFailureState extends DeviceInfoState {
  final String message;
  final DioException? dioException;

  const DeviceInfoFailureState({
    required this.message,
    this.dioException,
  });

  @override
  List<Object> get props => [message];
}
