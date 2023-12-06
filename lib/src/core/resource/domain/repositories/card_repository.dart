import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/src/core/common/state/blocs/card/card_bloc.dart';

abstract interface class CardRepository {
  Future<void> getCard(GetCardEvent event, Emitter<CardState> emit, CardState state);
  Future<void> saveCard(SaveCardEvent event, Emitter<CardState> emit, CardState state);
  Future<void> likeCard(LikeCardEvent event, Emitter<CardState> emit, CardState state);
  Future<void> getSearchBusinessTags(GetSearchBusinessTags event, Emitter<CardState> emit, CardState state);
  Future<void> search(SearchEvent event, Emitter<CardState> emit, CardState state);
  Future<void> searchChat(SearchChatEvent event, Emitter<CardState> emit, CardState state);
  Future<void> getPaginatorCards(GetPaginatorCardsEvent event, Emitter<CardState> emit, CardState state);
  Future<void> postReview(PostReviewEvent event, Emitter<CardState> emit);
  Future<void> deleteReview(DeleteReviewEvent event, Emitter<CardState> emit);
  Future<void> pointsCreditingCheck(PointsCreditingCheckEvent event, Emitter<CardState> emit);
  Future<void> getReviewsPaginator(GetReviewsPaginatorEvent event, Emitter<CardState> emit, CardState state);
}
