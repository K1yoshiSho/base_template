import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/media.dart';

class ReviewModel extends Equatable {
  final int id;
  final int rating;
  final String date;
  final String text;
  final UserModel? user;
  final bool isVisible;
  final List<MediaModel> medias;
  final CardModel? card;

  const ReviewModel({
    required this.id,
    required this.rating,
    required this.date,
    required this.text,
    required this.user,
    required this.isVisible,
    required this.medias,
    required this.card,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as int? ?? 0,
      rating: json['rating'] as int? ?? 0,
      date: json['date'] as String,
      text: json['text'] as String,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      isVisible: json['is_visible'] as bool? ?? true,
      medias: MediaModel.fromList(json['media']),
      card: json['card'] != null ? CardModel.fromJson(json['card']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'date': date,
      'text': text,
      'user': user?.toJson(),
      'isVisible': isVisible,
      'medias': medias.map((e) => e.toJson()).toList(),
      'card': card?.toJson(),
    };
  }

  static List<ReviewModel> fromList(List<dynamic> json) {
    return json.map((e) => ReviewModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        rating,
        date,
        text,
        user,
        isVisible,
        medias,
        card,
      ];
}

// class CardReviewModel extends Equatable {
//   final int id;
//   final String? preview;
//   final String name;
//   final String? address;
//   final double? rating;

//   const CardReviewModel({
//     required this.id,
//     required this.preview,
//     required this.name,
//     required this.address,
//     required this.rating,
//   });

//   factory CardReviewModel.fromJson(Map<String, dynamic> json) {
//     return CardReviewModel(
//       id: json['id'] as int? ?? 0,
//       preview: json['preview'] as String?,
//       name: json['name'] as String,
//       address: json['address'] as String?,
//       rating: json['rating'] as double?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'preview': preview,
//       'name': name,
//       'address': address,
//       'rating': rating,
//     };
//   }

//   static List<CardReviewModel> fromList(List<dynamic> json) {
//     return json.map((e) => CardReviewModel.fromJson(e)).toList();
//   }

//   @override
//   List<Object?> get props => [
//         id,
//         preview,
//         name,
//         address,
//         rating,
//       ];
// }
