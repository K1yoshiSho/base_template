final class Parser {
  static List<String> fromListString(List<dynamic>? json) {
    return json?.map((e) => e.toString()).toList() ?? [];
  }
}
