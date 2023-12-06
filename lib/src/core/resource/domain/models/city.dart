import 'package:equatable/equatable.dart';
import 'package:base/src/core/resource/domain/models/latlng.dart';

class CityModel extends Equatable {
  final int id;
  final String name;
  final LatLng location;

  const CityModel({
    required this.id,
    required this.name,
    required this.location,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json['id'] as int,
        name: json['name'] as String,
        location: LatLng(
          latitude: json['latitude'] as double?,
          longitude: json['longitude'] as double?,
        ));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': location.latitude,
      'longitude': location.longitude,
    };
  }

  static List<CityModel> fromList(List<dynamic> json) {
    return json.map((e) => CityModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
        location,
      ];
}
