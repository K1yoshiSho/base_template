import 'package:equatable/equatable.dart';

class LatLng extends Equatable {
  final double? latitude;
  final double? longitude;

  const LatLng({
    required this.latitude,
    required this.longitude,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) {
    return LatLng(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static List<LatLng> fromList(List<dynamic> json) {
    return json.map((e) => LatLng.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
