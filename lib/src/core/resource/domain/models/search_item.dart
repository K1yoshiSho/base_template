import 'package:base/src/core/common/exports/main_export.dart';

class SearchItem extends Equatable {
  final int id;
  final String name;
  final int type;
  final int count;
  final String address;

  bool get isBusiness => type == 1;

  bool get isEvent => type == 2;

  bool get isTag => type == 3;

  const SearchItem({
    required this.id,
    required this.name,
    required this.type,
    required this.count,
    required this.address,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    String name = json['name'] as String? ?? "";
    return SearchItem(
      id: json['id'],
      name: name.capitalize(),
      address: json['address'] ?? "",
      type: json['type'] ?? 0,
      count: json['count'] ?? 0,
    );
  }

  static List<SearchItem> fromList(List<dynamic> json) {
    return json.map((e) => SearchItem.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        count,
        address,
      ];
}
