// package import
import 'package:base/src/core/common/exports/main_export.dart';

class AppError extends StatelessWidget {
  final String? message;
  final double? height;

  const AppError({super.key, this.message, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Gap(height ?? 120),
        InkWell(
          onTap: () {
            // AppInfoDialog.show(
            //   context: context,
            //   title: context.l10n.error,
            //   message: message ?? context.l10n.some_error,
            // );
          },
          child: const SvgWrapper(
            name: 'ic_error',
            height: 122,
            width: 122,
          ),
        ),
        const Gap(32),
        Text(
          context.l10n.some_error,
          textAlign: TextAlign.center,
          style: AppTextStyle.b1(context),
        ),
        const Gap(8),
        Text(
          message ?? context.l10n.some_error_hint,
          textAlign: TextAlign.center,
          style: AppTextStyle.b3(context),
        ),
      ],
    );
  }
}
