import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/latlng.dart';
import 'package:base/src/core/resource/domain/models/media.dart';
import 'package:base/src/core/resource/domain/models/review.dart';
import 'package:base/src/core/resource/domain/models/search_business_tag.dart';
import 'package:base/src/core/resource/domain/models/search_item.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardInitial()) {
    on<ToInitialEvent>((event, emit) => emit(const CardInitial()));
    on<GetCardEvent>((event, emit) => dependenciesContainer.cardRepository.getCard(event, emit, state));
    on<SaveCardEvent>((event, emit) => dependenciesContainer.cardRepository.saveCard(event, emit, state));
    on<LikeCardEvent>((event, emit) => dependenciesContainer.cardRepository.likeCard(event, emit, state));
    on<GetSearchBusinessTags>((event, emit) => dependenciesContainer.cardRepository.getSearchBusinessTags(event, emit, state));
    on<SearchEvent>((event, emit) => dependenciesContainer.cardRepository.search(event, emit, state));
    on<SearchChatEvent>((event, emit) => dependenciesContainer.cardRepository.searchChat(event, emit, state));
    on<GetPaginatorCardsEvent>((event, emit) => dependenciesContainer.cardRepository.getPaginatorCards(event, emit, state));
    on<PostReviewEvent>((event, emit) => dependenciesContainer.cardRepository.postReview(event, emit));
    on<DeleteReviewEvent>((event, emit) => dependenciesContainer.cardRepository.deleteReview(event, emit));
    on<PointsCreditingCheckEvent>((event, emit) => dependenciesContainer.cardRepository.pointsCreditingCheck(event, emit));
    on<GetReviewsPaginatorEvent>((event, emit) => dependenciesContainer.cardRepository.getReviewsPaginator(event, emit, state));
  }
}
