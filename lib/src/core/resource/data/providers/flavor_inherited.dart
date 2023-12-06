import 'package:flutter/material.dart';
import 'package:base/src/core/utils/other/base_config.dart';

class ConfigWrapper extends InheritedWidget {
  final BaseConfig config;

  const ConfigWrapper({
    super.key,
    required this.config,
    required Widget child,
  }) : super(child: child);

  static BaseConfig of(BuildContext context) {
    final ConfigWrapper? wrapper = context.dependOnInheritedWidgetOfExactType<ConfigWrapper>();
    if (wrapper != null) {
      return wrapper.config;
    }
    throw Exception('No ConfigWrapper found in widget tree');
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

extension ConfigWrapperExtension on BuildContext {
  BaseConfig get config => ConfigWrapper.of(this);
}
