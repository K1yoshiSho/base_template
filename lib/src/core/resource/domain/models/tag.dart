// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TagModel extends Equatable {
  final int id;
  final String name;
  final String nameKk;
  final String nameEn;
  final String? icon;
  final String? color;
  final bool isSelected;

  const TagModel({
    required this.id,
    required this.name,
    required this.nameKk,
    required this.nameEn,
    required this.icon,
    required this.color,
    required this.isSelected,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'] as int,
      name: json['name'] as String,
      nameKk: json['name_kk'] as String? ?? '',
      nameEn: json['name_eng'] as String? ?? '',
      icon: json['icon'] as String?,
      color: json['color'] as String?,
      isSelected: json['is_selected'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_kk': nameKk,
      'name_eng': nameEn,
      'icon': icon,
      'color': color,
      'is_selected': isSelected,
    };
  }

  static List<TagModel> fromList(List<dynamic> json) {
    return json.map((e) => TagModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
        nameKk,
        nameEn,
        icon,
        color,
      ];
}
