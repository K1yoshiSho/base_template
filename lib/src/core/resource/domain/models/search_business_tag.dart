// ignore_for_file: must_be_immutable

import 'package:base/src/core/common/exports/main_export.dart';

class SearchBusinessTag extends Equatable {
  final int id;
  final String name;

  const SearchBusinessTag({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory SearchBusinessTag.fromJson(Map<String, dynamic> json) => SearchBusinessTag(
        id: json['id'] as int,
        name: (json['name'] as String).capitalize(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  static List<SearchBusinessTag> fromList(List<dynamic> jsonList) =>
      jsonList.map((json) => SearchBusinessTag.fromJson(json as Map<String, dynamic>)).toList();
}
