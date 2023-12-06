part of 'device_info_bloc.dart';

sealed class DeviceInfoEvent extends Equatable {
  const DeviceInfoEvent();

  @override
  List<Object> get props => [];
}

final class SendDeviceInfoEvent extends DeviceInfoEvent {
  const SendDeviceInfoEvent();

  @override
  List<Object> get props => [];
}
