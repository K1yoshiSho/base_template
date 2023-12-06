import 'package:flutter_svg/svg.dart';
import 'package:base/src/core/common/exports/main_export.dart';

/// `CustomErrorComponent` is a widget that shows error message and on tap it call again our function.

class AppFailurer extends StatelessWidget {
  final DioException? dioException;
  final Exception? exception;
  final Function()? onTap;
  const AppFailurer({
    super.key,
    this.dioException,
    this.exception,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.repair,
          width: 100,
          height: 100,
        ),
        const Gap(20),
        Text(
          context.l10n.some_error,
          style: AppTextStyle.b1(context),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          context.l10n.some_error_hint,
          style: AppTextStyle.b3(context),
          textAlign: TextAlign.center,
        ),
        if (onTap != null) ...[
          Column(
            children: [
              const Gap(20),
              AppButton(
                text: context.l10n.tryAgain,
                onPressed: onTap,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
