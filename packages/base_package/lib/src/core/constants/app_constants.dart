/// [FlavorKey] - This class contains flavor keys.
final class FlavorKey {
  static const String kIsProduction = "isProduction";
  static const String kDevelopment = "dev";
  static const String kProduction = "prod";
}

enum ReviewsPaginatorTypes {
  byCard,
  byUser,
}

enum CUDTypes {
  create,
  update,
  delete,
}

enum LocifyPaginatorTypes {
  nearby,
  hotEvents,
  shouldTry,
  bookmarked,
  byCategory,
  youVisited,
}

enum AppIndicatorResult {
  /// No state until the task is not triggered.
  none,

  /// Task succeeded.
  success,

  /// Task failed.
  fail,

  /// No more data.
  noMore,
}

enum CategoryType {
  popular,
  sightseeing,
  locaChoice,
  lowCost,
  collectPoints,
}

/// [RepeatKeys] - This class contains Repeat keys.
final class RepeatKeys {
  static const String kEveryDay = "daily";
  static const String kEveryWeek = "weekly";
  static const String kEveryMonth = "monthly";
  static const String kQuarterly = "quarterly";

  static const List<String> keys = [
    kEveryDay,
    kEveryWeek,
    kEveryMonth,
    kQuarterly,
  ];
}

/// [ECPKeys] - This class contains ECP keys: with or without.

final class ScreenExtras {
  static const String title = "title";
  static const String data = "data";
  static const String id = "id";
  static const String type = "type";
  static const String phone = "phone";
  static const String initialIndex = "initialIndex";
  static const String images = "images";
  static const String object = "object";
  static const String card = "card";
  static const String function = "function";
  static const String url = "url";
  static const String userId = "userId";
  static const String isRefresh = "isRefresh";
  static const String categoryType = "categoryType";
  static const String latLng = "latLng";
  static const String boolean = "boolean";
  static const String review = "review";
  static const String initialItems = "initialItems";
  static const String isAnotherUser = "isAnotherUser";
  static const String collection = "collection";
  static const String onDeleted = "onDeleted";
  static const String onUpdated = "onUpdated";
}

sealed class MyDriveVisibiliy {
  static const String private = "private";
  static const String public = "public";
  static const String shared = "shared";
}

enum NewsFilterEnum {
  all,
  my,
  favourite,
  adv,
}
