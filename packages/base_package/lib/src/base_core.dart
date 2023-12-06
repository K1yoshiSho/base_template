import 'core/utils/delta_markdown/util.dart';
import 'core/utils/html_markdown/converter.dart';

const DeltaMarkdownCodec _kCodec = DeltaMarkdownCodec();

final class Base {
  const Base();

  static String markdownToDelta(String markdown) {
    return _kCodec.decode(markdown);
  }

  static String deltaToMarkdown(String delta) {
    return _kCodec.encode(delta);
  }

  static String htmlToMarkdown(String html) {
    return convertToMarkDown(html);
  }
}
