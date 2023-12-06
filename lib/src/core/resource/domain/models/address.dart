// import 'package:base/src/core/common/exports/main_export.dart';

// class AddressModel extends Equatable {
//   final String imageSmall;
//   final String imageFull;

//   const AddressModel({
//     required this.id,
//     required this.link,
//     required this.imageFull,
//     required this.imageSmall,
//   });

//   factory AddressModel.fromJson(Map<String, dynamic> json) {
//     return AddressModel(
//       id: json['id'] as int,
//       link: json['link'] as String,
//       imageFull: json['image_full'] as String,
//       imageSmall: json['image_small'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'link': link,
//       'image_full': imageFull,
//       'image_small': imageSmall,
//     };
//   }

//   static List<AddressModel> fromList(List<dynamic> json) {
//     return json.map((e) => AddressModel.fromJson(e)).toList();
//   }

//   @override
//   List<Object?> get props => [
//         id,
//         link,
//         imageFull,
//         imageSmall,
//       ];
// }
