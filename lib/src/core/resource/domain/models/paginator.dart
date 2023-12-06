import 'package:base/src/core/common/exports/main_export.dart';

final class Paginator extends Equatable {
  final int nextPage;
  final bool hasNextPage;
  final bool isRefresh;

  const Paginator({
    required this.nextPage,
    required this.hasNextPage,
    required this.isRefresh,
  });

  @override
  List<Object?> get props => [nextPage, hasNextPage, isRefresh];

  static Paginator defaultPaginator() => const Paginator(
        nextPage: 1,
        hasNextPage: true,
        isRefresh: false,
      );
}
