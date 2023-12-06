import 'package:base/src/core/common/exports/main_export.dart';

class ExeptionModel {
  final String message;
  final DioException? dioException;
  final Exception? exception;
  final Function()? onTap;

  const ExeptionModel({
    required this.message,
    this.dioException,
    this.exception,
    this.onTap,
  });
}
