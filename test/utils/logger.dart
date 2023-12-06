import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void testLogger({required String title, required String body}) => Logger(
      output: ConsoleOutput(),
      filter: null,
      printer: PrettyPrinter(methodCount: 0),
    ).d("$title: $body");

Future<void> titleTestLogger({required String title, required String body}) async {
  test("$title: $body", () {
    Logger(
      output: ConsoleOutput(),
      filter: null,
      printer: PrettyPrinter(methodCount: 0),
    ).i("$title: $body");
    expect("", isNotNull);
  });
}
