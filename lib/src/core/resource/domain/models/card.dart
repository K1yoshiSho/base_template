import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/distance.dart';
import 'package:base/src/core/resource/domain/models/media.dart';
import 'package:base/src/core/resource/domain/models/review.dart';
import 'package:base/src/core/resource/domain/models/search_item.dart';
import 'package:base/src/core/resource/domain/models/tag.dart';
import 'package:base/src/core/utils/other/parser.dart';

class CardModel extends Equatable {
  final int id;
  final int type;
  final String name;
  final String? description;
  final String category;
  final DateTime? startAt;
  final DateTime? endAt;
  final bool isFree;
  final bool isLiked;
  final bool isSaved;
  final int saveCount;
  final int likeCount;
  final String daysLeft;
  final DistanceModel? distance;
  final List<MediaModel> media;
  final String previewImage;
  final String fullPreview;
  final List<TagModel> tags;
  final String workTime;
  final String address;
  final String? street;
  final String? house;
  final List<String> phones;
  final int? priceFrom;
  final String purchase;
  final Map<String, dynamic> links;
  final int? pointsAmount;
  final int? minFee;
  final int? averageCheck;
  final double rating;
  final bool canReview;
  final List<ReviewModel> reviews;
  final bool isTemporary;
  final bool isUserCreated;

  bool get isBusiness => type == 1;
  bool get isEvent => type == 2;

  const CardModel({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.category,
    required this.startAt,
    required this.endAt,
    required this.isFree,
    required this.isLiked,
    required this.isSaved,
    required this.saveCount,
    required this.likeCount,
    required this.daysLeft,
    required this.distance,
    required this.media,
    required this.previewImage,
    required this.fullPreview,
    required this.tags,
    required this.links,
    required this.address,
    required this.workTime,
    required this.phones,
    required this.purchase,
    required this.priceFrom,
    required this.pointsAmount,
    required this.minFee,
    required this.averageCheck,
    required this.rating,
    required this.canReview,
    required this.reviews,
    required this.street,
    required this.house,
    this.isTemporary = false,
    this.isUserCreated = false,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as int,
      type: json['type'] as int,
      name: json['name'] as String,
      address: json['address'] as String? ?? '',
      description: json['description'] as String?,
      category: json['category'] as String? ?? '',
      startAt: (json['date_start'] != null) ? DateTime.parse(json['date_start']) : null,
      endAt: (json['date_end'] != null) ? DateTime.parse(json['date_end']) : null,
      isFree: json['is_free'] as bool? ?? false,
      isLiked: json['is_liked'] as bool? ?? false,
      isSaved: json['is_saved'] as bool? ?? false,
      saveCount: json['saves_count'] as int? ?? 0,
      likeCount: json['likes_count'] as int? ?? 0,
      daysLeft: json['days_left'] as String? ?? '',
      distance: (json['distance'] != null) ? DistanceModel.fromJson(json['distance']) : null,
      media: MediaModel.fromList(json['media']),
      previewImage: json['preview'] as String? ?? '',
      fullPreview: json['full_preview'] as String? ?? '',
      tags: json['tags'] != null ? TagModel.fromList(json['tags']) : [],
      links: (json['links'] != null) ? json['links'] : {},
      workTime: json['time'] ?? '',
      phones: Parser.fromListString(json['phones']),
      purchase: json['purchase'] ?? '',
      priceFrom: json['price_from'],
      pointsAmount: json['points_amount'] as int?,
      minFee: json['min_fee'] as int?,
      averageCheck: json['average_check'] as int?,
      rating: json['rating'] != null ? double.parse(json['rating'].toString()) : 0.0,
      canReview: json['can_review'] as bool? ?? false,
      reviews: json['reviews'] != null ? ReviewModel.fromList(json['reviews']) : [],
      street: json['street'] as String?,
      house: json['house'] as String?,
      isUserCreated: json['is_user_created'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'address': address,
      'description': description,
      'category': category,
      'date_start': startAt?.toIso8601String(),
      'date_end': endAt?.toIso8601String(),
      'is_free': isFree,
      'is_liked': isLiked,
      'is_saved': isSaved,
      'saves_count': saveCount,
      'likes_count': likeCount,
      'days_left': daysLeft,
      'distance': distance?.toJson(),
      'media': media.map((e) => e.toJson()).toList(),
      'preview': previewImage,
      'full_preview': fullPreview,
      'tags': tags.map((e) => e.toJson()).toList(),
      'links': links,
      'time': workTime,
      'phones': phones,
      'purchase': purchase,
      'price_from': priceFrom,
      'points_amount': pointsAmount,
      'min_fee': minFee,
      'average_check': averageCheck,
      'rating': rating,
      'can_review': canReview,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'street': street,
      'house': house,
      'is_user_created': isUserCreated,
    };
  }

  Map<String, dynamic> toCollectionJson() {
    return {
      'card': id,
      'name': name,
      'street': street,
      'house': house,
    };
  }

  static List<CardModel> fromList(List<dynamic> json) {
    return json.map((e) => CardModel.fromJson(e)).toList();
  }

  factory CardModel.collectionCard({required int? id, required String name, required String street, required String house}) {
    return CardModel(
      id: id ?? -1,
      type: 1,
      name: name,
      description: "",
      category: "",
      isFree: true,
      isLiked: false,
      isSaved: false,
      saveCount: 0,
      likeCount: 0,
      daysLeft: "",
      media: const [],
      previewImage: "",
      fullPreview: "",
      tags: const [],
      links: const {},
      address: "",
      street: street,
      house: house,
      workTime: "",
      phones: const [],
      purchase: "",
      distance: null,
      startAt: null,
      endAt: null,
      priceFrom: null,
      pointsAmount: null,
      minFee: null,
      averageCheck: null,
      rating: 0.0,
      canReview: false,
      reviews: const [],
      isTemporary: true,
    );
  }

  factory CardModel.formSearchItem(SearchItem item) {
    return CardModel(
      id: item.id,
      type: item.type,
      name: "",
      description: "",
      category: "",
      isFree: true,
      isLiked: false,
      isSaved: false,
      saveCount: 0,
      likeCount: 0,
      daysLeft: "",
      media: const [],
      street: null,
      house: null,
      previewImage: "",
      fullPreview: "",
      tags: const [],
      links: const {},
      address: "",
      workTime: "",
      phones: const [],
      purchase: "",
      distance: null,
      startAt: null,
      endAt: null,
      priceFrom: null,
      pointsAmount: null,
      minFee: null,
      averageCheck: null,
      rating: 0.0,
      canReview: false,
      reviews: const [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        description,
        category,
        startAt,
        endAt,
        isFree,
        isLiked,
        isSaved,
        saveCount,
        likeCount,
        daysLeft,
        distance,
        media,
        previewImage,
        fullPreview,
        tags,
        links,
        address,
        workTime,
        phones,
        purchase,
        priceFrom,
        pointsAmount,
        minFee,
        averageCheck,
        rating,
        canReview,
        reviews,
        street,
        house,
      ];
}
