import 'package:base/src/core/common/exports/main_export.dart';

class AppInfoDialog extends StatefulWidget {
  final String title;
  final String message;
  final Widget? action;

  const AppInfoDialog({
    super.key,
    required this.title,
    required this.message,
    this.action,
  });

  static Future show({
    required BuildContext context,
    required String title,
    required String message,
    Widget? action,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppPalette.white.withOpacity(0.3),
      builder: (context) {
        return AppInfoDialog(
          message: message,
          title: title,
          action: action,
        );
      },
    );
  }

  @override
  State<AppInfoDialog> createState() => _AppInfoDialogState();
}

class _AppInfoDialogState extends State<AppInfoDialog> {
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
            Text(
              widget.message.capitalize(),
              style: AppTextStyle.h4(context),
            ),
            if (widget.action != null) widget.action!
          ],
        ),
      ),
    );
  }

  Widget _buildTitleDialog() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title.capitalize(),
          style: AppTextStyle.h2(context),
        ),
        IconButton(
          icon: Icon(
            LocaIcons.outlined_cross_circle,
            size: 35,
            color: context.theme.appColors.text,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
