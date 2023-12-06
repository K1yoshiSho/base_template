import 'package:base/src/core/common/state/blocs/card/card_bloc.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/review.dart';
import 'package:base/src/core/resource/domain/models/search_business_tag.dart';
import 'package:base/src/core/resource/domain/models/search_item.dart';
import 'package:base/src/core/resource/domain/repositories/card_repository.dart';

final class DataCardRepository implements CardRepository {
  @override
  Future<void> deleteReview(DeleteReviewEvent event, Emitter<CardState> emit) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();
      emit(const CardLoadingState());
      final response = await HttpQuery().delete(
        url: "business_cards/card/review",
        headerData: headerData,
        data: {
          'review_id': event.reviewId,
        },
      );

      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(const DeleteReviewFetchedState());
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> pointsCreditingCheck(PointsCreditingCheckEvent event, Emitter<CardState> emit) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();
      emit(const CardLoadingState());
      final response = await HttpQuery().get(
        url: "accounts/user/points_crediting_check",
        headerData: headerData,
      );

      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(const PointsCreditingCheckFetchedState());
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> postReview(PostReviewEvent event, Emitter<CardState> emit) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeadersMultiPart();
      emit(const CardLoadingState());
      final List<MultipartFile> media = [];
      media.addAll(await Future.wait(List.generate(event.files.length, (index) => MultipartFile.fromFile(event.files[index].path))));
      final List<int> mediaToDeleteIds = event.mediaToDelete.map((e) => e.id).toList();

      FormData formData = FormData.fromMap({
        if (event.isEditReview) 'id': event.reviewId,
        if (!event.isEditReview) 'card_id': event.cardId,
        'text': event.text,
        'rating': event.rating,
        'is_visible': event.isVisible,
        'media': media,
        'media_to_delete': mediaToDeleteIds,
      });

      dynamic response;
      if (event.isEditReview) {
        response = await HttpQuery().put(
          url: "business_cards/card/review",
          headerData: headerData,
          data: formData,
        );
      } else {
        response = await HttpQuery().post(
          url: "business_cards/card/review",
          headerData: headerData,
          data: formData,
        );
      }
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(const PostReviewFetchedState());
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> getCard(GetCardEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();
      const businessPath = 'business_cards/business_card/v2';
      const eventPath = 'event/event';
      final path = (event.cardType == 1) ? businessPath : eventPath;
      final queryParameterName = (event.cardType == 1) ? 'business_id' : 'event_id';

      if (state is! GetCardFetchedState) {
        emit(const CardLoadingState());
      }

      final response = await HttpQuery().get(
        url: path,
        headerData: headerData,
        queryParameters: {
          queryParameterName: event.cardId,
          if (event.latLng?.latitude != null) 'latitude': event.latLng?.latitude,
          if (event.latLng?.longitude != null) 'longitude': event.latLng?.longitude,
        },
      );
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(GetCardFetchedState(card: CardModel.fromJson(response)));
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> getReviewsPaginator(GetReviewsPaginatorEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      if (state is! GetReviewsPaginatorFetchedState) {
        emit(const CardLoadingState());
      }

      final String url = switch (event.type) {
        ReviewsPaginatorTypes.byCard => 'business_cards/card/review',
        ReviewsPaginatorTypes.byUser => 'accounts/user/reviews',
      };

      final response = await HttpQuery().get(
        url: url,
        headerData: headerData,
        queryParameters: {
          'page': event.page,
          'card_id': event.cardId,
          if (event.count != null) 'count': event.count,
        },
      );

      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
        event.onCompleted(result: AppIndicatorResult.fail);
      } else {
        final int nextPage = response['next_page'] as int? ?? -1;
        final bool hasNextPage = nextPage != -1 ? true : false;
        final List<ReviewModel> reviews = ReviewModel.fromList(response['data']);
        emit(GetReviewsPaginatorFetchedState(
          reviews: reviews,
          paginator: Paginator(
            nextPage: nextPage,
            hasNextPage: hasNextPage,
            isRefresh: event.isRefresh,
          ),
        ));

        if (reviews.isNotEmpty) {
          event.onCompleted(result: AppIndicatorResult.success);
        } else {
          event.onCompleted(result: AppIndicatorResult.noMore);
        }
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
      event.onCompleted(result: AppIndicatorResult.fail);
    }
  }

  @override
  Future<void> getPaginatorCards(GetPaginatorCardsEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      if (state is! GetCardsPaginatorFetchedState) {
        emit(const CardLoadingState());
      }
      String path = switch (event.type) {
        LocifyPaginatorTypes.shouldTry => 'business_cards/business_card/should_try',
        LocifyPaginatorTypes.nearby => 'business_cards/business_card/nearby',
        LocifyPaginatorTypes.hotEvents => 'event/hot',
        LocifyPaginatorTypes.bookmarked => 'v2/accounts/user/favorites',
        LocifyPaginatorTypes.youVisited => 'accounts/user/visited_cards',
        LocifyPaginatorTypes.byCategory => event.categoryType != null
            ? switch (event.categoryType!) {
                CategoryType.popular => 'business_cards/popular/v2',
                CategoryType.locaChoice => 'business_cards/loca_choice/v2',
                CategoryType.lowCost => 'business_cards/cheap/v2',
                CategoryType.sightseeing => 'business_cards/business_card/sights',
                CategoryType.collectPoints => 'business_cards/collect_points',
              }
            : "",
      };

      final response = await HttpQuery().get(
        url: path,
        headerData: headerData,
        queryParameters: {
          'page': event.page,
          if (event.userId != null) 'user_id': event.userId,
          if (event.count != null) 'count': event.count,
          if (event.latLng?.latitude != null) 'latitude': event.latLng?.latitude,
          if (event.latLng?.longitude != null) 'longitude': event.latLng?.longitude,
        },
      );

      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
        event.onCompleted(result: AppIndicatorResult.fail);
      } else {
        final int nextPage = response['next_page'] as int? ?? -1;
        final bool hasNextPage = nextPage != -1 ? true : false;
        final List<CardModel> cards = CardModel.fromList(response['data']);
        emit(GetCardsPaginatorFetchedState(
          cards: cards,
          paginator: Paginator(
            nextPage: nextPage,
            hasNextPage: hasNextPage,
            isRefresh: event.isRefresh,
          ),
        ));

        if (cards.isNotEmpty) {
          event.onCompleted(result: AppIndicatorResult.success);
        } else {
          event.onCompleted(result: AppIndicatorResult.noMore);
        }
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
      event.onCompleted(result: AppIndicatorResult.fail);
    }
  }

  @override
  Future<void> getSearchBusinessTags(GetSearchBusinessTags event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      if (state is! GetSearchBusinessTagsFetchedState) {
        emit(const CardLoadingState());
      }

      final response = await HttpQuery().get(
        url: "tags/collection/all/",
        headerData: headerData,
      );
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(GetSearchBusinessTagsFetchedState(
          tags: SearchBusinessTag.fromList(response),
        ));
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> likeCard(LikeCardEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();
      const businessPath = 'business_cards/business_card/like/';
      const eventPath = 'event/event/like/';
      final path = (event.cardType == 1) ? businessPath : eventPath;
      final parameterName = (event.cardType == 1) ? 'business_id' : 'event_id';

      emit(const CardLoadingState());

      final response = await HttpQuery().post(
        url: path,
        headerData: headerData,
        data: {
          parameterName: event.cardId,
        },
      );

      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(const LikeCardFetchedState());
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> saveCard(SaveCardEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();
      const businessPath = 'business_cards/business_card/save/';
      const eventPath = 'event/event/save/';
      final path = (event.cardType == 1) ? businessPath : eventPath;
      final parameterName = (event.cardType == 1) ? 'business_id' : 'event_id';

      emit(const CardLoadingState());

      final response = await HttpQuery().post(
        url: path,
        headerData: headerData,
        data: {
          parameterName: event.cardId,
        },
      );

      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        emit(const SaveCardFetchedState());
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> search(SearchEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      if (state is! SearchFetchedState) {
        emit(const CardLoadingState());
      }

      final response = await HttpQuery().get(
        url: "search/universal/v2",
        headerData: headerData,
        queryParameters: {
          'name': event.query.trim(),
          'page': event.page,
        },
      );
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        final int nextPage = response['next_page'] as int? ?? -1;
        final bool hasNextPage = nextPage != -1 ? true : false;
        final List<SearchItem> cards = [];
        if (event.onlyBusiness) {
          final List<SearchItem> businessCards = [
            for (var item in SearchItem.fromList(response['data']))
              if (item.type == 1) item,
          ];

          cards.addAll(businessCards);
        } else {
          cards.addAll(SearchItem.fromList(response['data']));
        }

        emit(SearchFetchedState(
          searchItems: cards,
          paginator: Paginator(
            nextPage: nextPage,
            hasNextPage: hasNextPage,
            isRefresh: true,
          ),
        ));
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }

  @override
  Future<void> searchChat(SearchChatEvent event, Emitter<CardState> emit, CardState state) async {
    try {
      Map<String, dynamic>? headerData = AppUtils.getDefaultHeaders();

      if (state is! SearchCardsFetchedState) {
        emit(const CardLoadingState());
      }

      final response = await HttpQuery().get(
        url: "search/chat",
        headerData: headerData,
        queryParameters: {
          'name': event.query.trim(),
        },
      );
      if (response is DioException) {
        DioException e = response;
        dependenciesContainer.talker.handle(e, e.stackTrace);
        emit(CardFailureState(error: e.message ?? "", errorDio: e));
      } else {
        final List<CardModel> cards = CardModel.fromList(response['data']);
        emit(SearchCardsFetchedState(
          cards: cards,
        ));
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      emit(CardFailureState(error: e.toString()));
    }
  }
}
