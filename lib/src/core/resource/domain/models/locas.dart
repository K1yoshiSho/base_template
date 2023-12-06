import 'package:base/src/core/common/exports/main_export.dart';

// ignore: must_be_immutable
class LocasModel extends Equatable {
  final int id;
  final String? previewImageUrl;
  final String? videoUrl;
  final String? description;
  final List<int> businesses;
  final bool isViewed;
  bool hasLike;
  final int likesCount;
  final List<CardModel> cards;

  LocasModel({
    required this.id,
    required this.previewImageUrl,
    required this.videoUrl,
    required this.description,
    required this.businesses,
    required this.isViewed,
    this.hasLike = false,
    required this.likesCount,
    required this.cards,
  });

  factory LocasModel.fromJson(Map<String, dynamic> json) {
    return LocasModel(
      id: json['id'] as int,
      previewImageUrl: json['previewImage'] as String?,
      videoUrl: json['mediaFile'] as String?,
      description: json['description'] as String?,
      businesses: json['businesses'].cast<int>(),
      isViewed: json['isViewed'] ?? false,
      hasLike: json['is_like'] ?? false,
      likesCount: json['likes_count'] ?? 0,
      cards: json['cards'] != null ? CardModel.fromList(json['cards']) : [],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'previewImage': previewImageUrl,
      'mediaFile': videoUrl,
      'description': description,
      'businesses': businesses,
      'isViewed': isViewed,
      'is_like': hasLike,
      'likes_count': likesCount,
      'cards': cards.map((e) => e.toJson()).toList(),
    };
  }

  static List<LocasModel> fromList(List<dynamic> json) {
    return json.map((e) => LocasModel.fromJson(e)).toList();
  }

  LocasModel markViewed(bool isViewed) {
    return LocasModel(
      id: id,
      previewImageUrl: previewImageUrl,
      videoUrl: videoUrl,
      description: description,
      businesses: businesses,
      isViewed: isViewed,
      hasLike: hasLike,
      likesCount: likesCount,
      cards: cards,
    );
  }

  LocasModel markLiked(bool hasLike) {
    return LocasModel(
      id: id,
      previewImageUrl: previewImageUrl,
      videoUrl: videoUrl,
      description: description,
      businesses: businesses,
      isViewed: isViewed,
      hasLike: hasLike,
      likesCount: likesCount,
      cards: cards,
    );
  }

  @override
  List<Object?> get props => [
        id,
        previewImageUrl,
        videoUrl,
        description,
        businesses,
        isViewed,
        hasLike,
        likesCount,
      ];
}
