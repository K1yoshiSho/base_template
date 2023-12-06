import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int id;
  final String link;
  final String imageSmall;
  final String imageFull;

  const BannerModel({
    required this.id,
    required this.link,
    required this.imageFull,
    required this.imageSmall,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      link: json['link'] as String,
      imageFull: json['image_full'] as String,
      imageSmall: json['image_small'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'link': link,
      'image_full': imageFull,
      'image_small': imageSmall,
    };
  }

  static List<BannerModel> fromList(List<dynamic> json) {
    return json.map((e) => BannerModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        link,
        imageFull,
        imageSmall,
      ];
}
