part of 'card_bloc.dart';

sealed class CardState extends Equatable {
  const CardState();

  @override
  List<Object?> get props => [GetCardsPaginatorFetchedState, GetReviewsPaginatorFetchedState];
}

final class CardInitial extends CardState {
  const CardInitial();
}

/// [Loading] states

final class CardLoadingState extends CardState {
  const CardLoadingState();
}

final class SearchLoadingState extends CardState {
  final List<SearchItem> oldItems;
  final bool isFirstFetch;
  const SearchLoadingState({
    this.oldItems = const [],
    this.isFirstFetch = false,
  });
}

/// [Failure] states

final class CardFailureState extends CardState {
  final String error;
  final DioException? errorDio;
  const CardFailureState({
    required this.error,
    this.errorDio,
  });

  @override
  List<Object?> get props => [error, errorDio];
}

/// [Fetched] states

final class GetCardsPaginatorFetchedState extends CardState {
  final List<CardModel> cards;
  final Paginator paginator;
  const GetCardsPaginatorFetchedState({
    required this.cards,
    required this.paginator,
  });

  @override
  List<Object?> get props => [cards, paginator];
}

final class GetCardFetchedState extends CardState {
  final CardModel? card;

  const GetCardFetchedState({
    required this.card,
  });

  @override
  List<Object?> get props => [card];
}

final class SaveCardFetchedState extends CardState {
  const SaveCardFetchedState();

  @override
  List<Object?> get props => [];
}

final class LikeCardFetchedState extends CardState {
  const LikeCardFetchedState();

  @override
  List<Object?> get props => [];
}

final class GetSearchBusinessTagsFetchedState extends CardState {
  final List<SearchBusinessTag> tags;

  const GetSearchBusinessTagsFetchedState({
    required this.tags,
  });

  @override
  List<Object?> get props => [tags];
}

final class SearchFetchedState extends CardState {
  final List<SearchItem> searchItems;
  final Paginator paginator;

  const SearchFetchedState({
    required this.searchItems,
    required this.paginator,
  });

  @override
  List<Object?> get props => [searchItems, paginator];
}

final class SearchCardsFetchedState extends CardState {
  final List<CardModel> cards;

  const SearchCardsFetchedState({
    required this.cards,
  });

  @override
  List<Object?> get props => [cards];
}

final class PostReviewFetchedState extends CardState {
  const PostReviewFetchedState();

  @override
  List<Object?> get props => [];
}

final class DeleteReviewFetchedState extends CardState {
  const DeleteReviewFetchedState();

  @override
  List<Object?> get props => [];
}

final class PointsCreditingCheckFetchedState extends CardState {
  const PointsCreditingCheckFetchedState();

  @override
  List<Object?> get props => [];
}

final class GetReviewsPaginatorFetchedState extends CardState {
  final List<ReviewModel> reviews;
  final Paginator paginator;
  const GetReviewsPaginatorFetchedState({
    required this.reviews,
    required this.paginator,
  });

  @override
  List<Object?> get props => [reviews, paginator];
}
