import 'package:base/src/core/resource/domain/repositories/app_banner_repository.dart';
import 'package:base/src/core/resource/domain/repositories/card_repository.dart';
import 'package:base/src/core/resource/domain/repositories/device_info_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

DependenciesContainer dependenciesContainer = DependenciesContainer();

class DependenciesContainer {
  static final DependenciesContainer _instance = DependenciesContainer._internal();

  factory DependenciesContainer() {
    return _instance;
  }

  DependenciesContainer._internal();

  /// [Dependencies] of the app.

  late final Talker _talker;
  late final AppBannerRepository _appBannerRepository;
  late final CardRepository _cardRepository;
  late final DeviceInfoRepository _deviceInfoRepository;

  /// [Init] all the required [dependencies] of the app.

  void init({
    required Talker talker,
    required AppBannerRepository appBannerRepository,
    required CardRepository cardRepository,
    required DeviceInfoRepository deviceInfoRepository,
  }) {
    _registerTalker(talker);
    _registerAppBannerRepository(appBannerRepository);
    _registerCardRepository(cardRepository);
    _registerDeviceInfoRepository(deviceInfoRepository);
  }

  /// [Register] all the required [dependencies] of the app.

  void _registerTalker(Talker talker) {
    _talker = talker;
  }

  void _registerAppBannerRepository(AppBannerRepository appBannerRepository) {
    _appBannerRepository = appBannerRepository;
  }

  void _registerCardRepository(CardRepository cardRepository) {
    _cardRepository = cardRepository;
  }

  void _registerDeviceInfoRepository(DeviceInfoRepository deviceInfoRepository) {
    _deviceInfoRepository = deviceInfoRepository;
  }

  /// [Getters]

  Talker get talker => _talker;
  AppBannerRepository get appBannerRepository => _appBannerRepository;
  CardRepository get cardRepository => _cardRepository;
  DeviceInfoRepository get deviceInfoRepository => _deviceInfoRepository;
}
