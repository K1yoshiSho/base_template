// import 'dart:convert';

// import 'package:base/src/core/resource/domain/models/media.dart';
// import 'package:base/src/core/utils/other/json_serializable.dart';

// class GeneralModelCodec extends Codec<Object?, String?> {
//   @override
//   Converter<Object?, String?> get encoder => GeneralModelEncoder();

//   @override
//   Converter<String?, Object?> get decoder => GeneralModelDecoder();
// }

// class GeneralModelEncoder extends Converter<Object?, String> {
//   @override
//   String convert(Object? input) {
//     if (input == null) {
//       return 'null';
//     }
//     if (input is JsonSerializable) {
//       return jsonEncode(input.toJson());
//     } else if (input is Map) {
//       // Обработка Map, где значения могут быть списками моделей.
//       var map = {};
//       input.forEach((key, value) {
//         map[key] = value is List ? value.map((item) => item.toJson()).toList() : value.toJson();
//       });
//       return jsonEncode(map);
//     } else if (input is List) {
//       // Обработка List, если List состоит из JsonSerializable объектов.
//       return jsonEncode(input.map((item) => item.toJson()).toList());
//     }
//     throw FormatException('Cannot encode object of type ${input.runtimeType}');
//   }
// }

// class GeneralModelDecoder extends Converter<String, Object?> {
//   @override
//   Object? convert(String input) {
//     var decoded = jsonDecode(input);
//     return _decodeValue(decoded);
//   }

//   Object? _decodeValue(Object? value) {
//     if (value is List) {
//       // Декодирование списка моделей.
//       return value.map((item) => _decodeValue(item)).toList();
//     } else if (value is Map) {
//       // Декодирование карты с возможными списками моделей как значений.
//       return value.map((key, item) => MapEntry(key, _decodeMapValue(item)));
//     } else {
//       return value;
//     }
//   }

//   Object? _decodeMapValue(Object? value) {
//     if (value is List) {
//       // Предположим, что если это список, то он состоит из моделей.
//       return value.map((item) {
//         return _fromJsonAsModel(item as Map<String, dynamic>);
//       }).toList();
//     } else if (value is Map && value.containsKey('type')) {
//       // Если это карта и содержит ключ 'type', предполагаем, что это модель.
//       return _fromJsonAsModel(value as Map<String, dynamic>);
//     } else {
//       return value;
//     }
//   }

//   JsonSerializable _fromJsonAsModel(Map<String, dynamic> json) {
//     String type = json['type'];
//     // Используйте соответствующий метод `fromJson` для конкретного типа данных.
//     switch (type) {
//       case 'MediaModel':
//         return MediaModel.fromJson(json);
//       // Добавьте кейсы для других типов моделей.
//       default:
//         throw FormatException('Unknown type for deserialization: $type');
//     }
//   }
// }
