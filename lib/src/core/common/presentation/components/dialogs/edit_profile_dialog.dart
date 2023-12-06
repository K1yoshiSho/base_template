import 'package:base/src/core/common/exports/main_export.dart';

class DeleteProfileDialog extends StatefulWidget {
  const DeleteProfileDialog({
    super.key,
  });

  static Future<bool?> show({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppPalette.white.withOpacity(0.3),
      builder: (context) {
        return const DeleteProfileDialog();
      },
    );
  }

  @override
  State<DeleteProfileDialog> createState() => _DeleteProfileDialogState();
}

class _DeleteProfileDialogState extends State<DeleteProfileDialog> {
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
              text: context.l10n.yes,
              isOutline: true,
              hasBorder: true,
            ),
            const Gap(12),
            AppButton(
              onPressed: () => Navigator.pop(context),
              buttonColor: AppPalette.mainGreen,
              text: context.l10n.no_i_ve_changed_my_mind,
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
            context.l10n.do_you_want_to_delete_your_profile.capitalize(),
            style: AppTextStyle.h2(context),
          ),
        ),
        const Gap(20),
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
