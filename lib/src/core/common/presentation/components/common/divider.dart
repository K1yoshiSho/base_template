import 'package:base/src/core/common/exports/main_export.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final double? height;
  const AppDivider({super.key, this.color, this.thickness, this.indent, this.endIndent, this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1.0,
      indent: indent ?? 0.0,
      endIndent: endIndent ?? 0.0,
      thickness: thickness ?? 1.0,
      color: color ?? context.theme.appColors.divider,
    );
  }
}
