import 'dart:convert';

import 'package:charcode/charcode.dart';

import 'delta_markdown_decoder.dart';
import 'delta_markdown_encoder.dart';
import 'version.dart';

const version = packageVersion;

/// Codec used to convert between Markdown and Quill deltas.
const DeltaMarkdownCodec _kCodec = DeltaMarkdownCodec();

String markdownToDelta(String markdown) {
  return _kCodec.decode(markdown);
}

String deltaToMarkdown(String delta) {
  return _kCodec.encode(delta);
}

class DeltaMarkdownCodec extends Codec<String, String> {
  const DeltaMarkdownCodec();

  @override
  Converter<String, String> get decoder => DeltaMarkdownDecoder();

  @override
  Converter<String, String> get encoder => DeltaMarkdownEncoder();
}

String escapeHtml(String html) => const HtmlEscape(HtmlEscapeMode.element).convert(html);

// Escape the contents of [value], so that it may be used as an HTML attribute.

// Based on http://spec.commonmark.org/0.28/#backslash-escapes.
String escapeAttribute(String value) {
  final result = StringBuffer();
  int ch;
  for (var i = 0; i < value.codeUnits.length; i++) {
    ch = value.codeUnitAt(i);
    if (ch == $backslash) {
      i++;
      if (i == value.codeUnits.length) {
        result.writeCharCode(ch);
        break;
      }
      ch = value.codeUnitAt(i);
      switch (ch) {
        case $quote:
          result.write('&quot;');
          break;
        case $exclamation:
        case $hash:
        case $dollar:
        case $percent:
        case $ampersand:
        case $apostrophe:
        case $lparen:
        case $rparen:
        case $asterisk:
        case $plus:
        case $comma:
        case $dash:
        case $dot:
        case $slash:
        case $colon:
        case $semicolon:
        case $lt:
        case $equal:
        case $gt:
        case $question:
        case $at:
        case $lbracket:
        case $backslash:
        case $rbracket:
        case $caret:
        case $underscore:
        case $backquote:
        case $lbrace:
        case $bar:
        case $rbrace:
        case $tilde:
          result.writeCharCode(ch);
          break;
        default:
          result.write('%5C');
          result.writeCharCode(ch);
      }
    } else if (ch == $quote) {
      result.write('%22');
    } else {
      result.writeCharCode(ch);
    }
  }
  return result.toString();
}
