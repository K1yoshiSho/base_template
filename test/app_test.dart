// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:base/bootstrap.dart';

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'utils/logger.dart';
import 'utils/path_platform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;
  setUp(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
  });
  titleTestLogger(title: 'Test type', body: 'Unit tests - utils');
  test('Test initMain with isProd equals to true', () {
    expect(bootstrapper(isProd: true), completes);
  });
}
