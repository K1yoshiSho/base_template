part of 'card_bloc.dart';

sealed class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

final class ToInitialEvent extends CardEvent {
  const ToInitialEvent();
}

final class GetPaginatorCardsEvent extends CardEvent {
  final int page;
  final int? userId;
  final int? count;
  final LatLng? latLng;
  final bool isRefresh;
  final Function({AppIndicatorResult? result}) onCompleted;
  final LocifyPaginatorTypes type;
  final CategoryType? categoryType;
  const GetPaginatorCardsEvent({
    required this.page,
    this.latLng,
    this.count,
    this.userId,
    required this.isRefresh,
    required this.onCompleted,
    required this.type,
    this.categoryType,
  });
}

final class GetReviewsPaginatorEvent extends CardEvent {
  final int cardId;
  final int page;
  final int? count;
  final bool isRefresh;
  final Function({AppIndicatorResult? result}) onCompleted;
  final ReviewsPaginatorTypes type;
  const GetReviewsPaginatorEvent({
    required this.cardId,
    required this.page,
    required this.count,
    required this.isRefresh,
    required this.onCompleted,
    required this.type,
  });
}

final class GetCardEvent extends CardEvent {
  final int cardId;
  final int cardType;
  final LatLng? latLng;
  const GetCardEvent({
    required this.cardId,
    required this.cardType,
    required this.latLng,
  });
}

final class SaveCardEvent extends CardEvent {
  final int cardId;
  final int cardType;
  const SaveCardEvent({
    required this.cardId,
    required this.cardType,
  });
}

final class LikeCardEvent extends CardEvent {
  final int cardId;
  final int cardType;
  const LikeCardEvent({
    required this.cardId,
    required this.cardType,
  });
}

final class GetSearchBusinessTags extends CardEvent {
  const GetSearchBusinessTags();
}

final class SearchEvent extends CardEvent {
  final String query;
  final int page;
  final bool onlyBusiness;
  const SearchEvent({
    required this.query,
    required this.page,
    this.onlyBusiness = false,
  });
}

final class SearchChatEvent extends CardEvent {
  final String query;

  const SearchChatEvent({
    required this.query,
  });
}

final class PostReviewEvent extends CardEvent {
  final int cardId;
  final int reviewId;
  final String text;
  final int rating;
  final bool isVisible;
  final List<File> files;
  final List<MediaModel> mediaToDelete;
  final bool isEditReview;
  const PostReviewEvent({
    required this.cardId,
    required this.reviewId,
    required this.rating,
    required this.text,
    required this.isVisible,
    required this.files,
    required this.isEditReview,
    required this.mediaToDelete,
  });
}

final class DeleteReviewEvent extends CardEvent {
  final int reviewId;
  const DeleteReviewEvent({
    required this.reviewId,
  });
}

final class PointsCreditingCheckEvent extends CardEvent {
  const PointsCreditingCheckEvent();
}
