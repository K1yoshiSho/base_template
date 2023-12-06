// package import

import 'package:base/src/core/common/exports/main_export.dart';

class AppEmpty extends StatelessWidget {
  final String? message;
  final double? height;
  const AppEmpty({super.key, this.message, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Gap(height ?? 64),
        const SvgWrapper(
          name: 'ic_empty',
          height: 122,
          width: 122,
          color: AppPalette.white,
        ),
        const Gap(32),
        Text(
          message ?? context.l10n.empty_result,
          style: AppTextStyle.b1(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
