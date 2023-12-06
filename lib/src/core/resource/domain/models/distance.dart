import 'package:base/src/core/common/exports/main_export.dart';

class DistanceModel extends Equatable {
  final double value;
  final String unit;

  const DistanceModel({
    required this.value,
    required this.unit,
  });

  factory DistanceModel.fromJson(Map<String, dynamic> json) {
    return DistanceModel(
      value: json['value'] / 1,
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
    };
  }

  @override
  List<Object?> get props => [
        value,
        unit,
      ];
}
