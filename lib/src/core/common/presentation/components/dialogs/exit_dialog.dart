import 'package:base/src/core/common/exports/main_export.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({
    super.key,
  });

  static Future<bool?> show({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppPalette.white.withOpacity(0.3),
      builder: (context) {
        return const ExitDialog();
      },
    );
  }

  @override
  State<ExitDialog> createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final width = fullWidth - 32;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: AppPalette.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      content: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleDialog(),
            const Gap(24),
            AppButton(
              onPressed: () => Navigator.pop(context, true),
              buttonColor: AppPalette.black,
              textColor: AppPalette.white,
              text: context.l10n.yes.capitalize(),
              isOutline: true,
              hasBorder: true,
            ),
            const Gap(12),
            AppButton(
              onPressed: () => Navigator.pop(context),
              buttonColor: AppPalette.mainGreen,
              text: context.l10n.no_i_ve_changed_my_mind.capitalize(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleDialog() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            context.l10n.exit_text.capitalize(),
            style: AppTextStyle.h2(context),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: AppPalette.white),
            ),
            child: const Icon(
              Icons.close,
              color: AppPalette.white,
            ),
          ),
        ),
      ],
    );
  }
}
