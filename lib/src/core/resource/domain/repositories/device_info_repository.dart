import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/src/core/common/state/blocs/device_info/device_info_bloc.dart';

abstract interface class DeviceInfoRepository {
  Future<void> sendDeviceInfo(SendDeviceInfoEvent event, Emitter<DeviceInfoState> emit);
}
