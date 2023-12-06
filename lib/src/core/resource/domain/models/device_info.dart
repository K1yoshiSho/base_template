import 'package:equatable/equatable.dart';

class DeviceInfo extends Equatable {
  final String uuid;
  final String localeCode;
  final String fcmToken;

  const DeviceInfo({
    required this.uuid,
    required this.localeCode,
    required this.fcmToken,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      uuid: json['uuid'] as String,
      localeCode: json['locale_code'] as String,
      fcmToken: json['fcm_token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'lang': localeCode,
      'FCM-token': fcmToken,
    };
  }

  static List<DeviceInfo> fromList(List<dynamic> json) {
    return json.map((e) => DeviceInfo.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        uuid,
        localeCode,
        fcmToken,
      ];
}
