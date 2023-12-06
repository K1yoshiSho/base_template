// lib/config/base_config.dart

import 'package:flutter/material.dart';

enum Environment { dev, prod }

const configMap = {
  Environment.dev: DevConfig(),
  Environment.prod: ProdConfig(),
};

@immutable
sealed class BaseConfig {
  final Environment environment;
  final String appName;
  final String flavor;

  const BaseConfig({required this.environment, required this.appName, required this.flavor});

  get getEnvironment => environment;

  get getAppName => appName;

  get isDev => environment == Environment.dev;

  get isProd => environment == Environment.prod;
}

class DevConfig extends BaseConfig {
  const DevConfig()
      : super(
          environment: Environment.dev,
          appName: "[DEV] Base project",
          flavor: "dev",
        );
}

class ProdConfig extends BaseConfig {
  const ProdConfig()
      : super(
          environment: Environment.prod,
          appName: "Base project",
          flavor: "prod",
        );
}
