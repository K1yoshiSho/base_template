import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/locas.dart';

class MediaModel extends Equatable {
  final int id;
  final String link;
  final int type;
  final String preview;
  final LocasModel? locas;

  bool get isLocas => type == 1;
  bool get isImage => type == 0;

  const MediaModel({
    required this.id,
    required this.link,
    required this.type,
    required this.preview,
    required this.locas,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] ?? 0,
      link: json['link'] ?? '',
      type: json['type'],
      preview: json['preview'] ?? '',
      locas: json['locas'] != null ? LocasModel.fromJson(json['locas']) : null,
    );
  }

  factory MediaModel.formLocas(LocasModel locas) {
    return MediaModel(
      id: locas.id,
      link: locas.videoUrl ?? "",
      type: 1,
      preview: locas.previewImageUrl ?? "",
      locas: locas,
    );
  }

  static List<MediaModel> fromList(List<dynamic>? json) {
    return json?.map((e) => MediaModel.fromJson(e)).toList() ?? [];
  }

  @override
  List<Object?> get props => [
        id,
        link,
        type,
        preview,
        locas,
      ];

  Map<String, dynamic>? toJson() {
    return {
      'id': id,
      'link': link,
      'type': type,
      'preview': preview,
      'locas': locas?.toJson(),
    };
  }
}
