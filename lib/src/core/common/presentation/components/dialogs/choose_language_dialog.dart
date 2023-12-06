import 'package:base/src/core/common/exports/main_export.dart';

class ChooseLanguageDialog extends StatefulWidget {
  const ChooseLanguageDialog({super.key});

  static Future show({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppPalette.white.withOpacity(0.3),
      builder: (context) {
        return const ChooseLanguageDialog();
      },
    );
  }

  @override
  State<ChooseLanguageDialog> createState() => _ChooseLanguageDialogState();
}

class _ChooseLanguageDialogState extends State<ChooseLanguageDialog> {
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
            _buildLanguageList(),
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
          context.l10n.language_selection,
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

  Widget _buildLanguageList() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildLanguageItem('English', 'en'),
        _buildLanguageItem('Русский', 'ru'),
      ],
    );
  }

  Widget _buildLanguageItem(String text, String key) {
    final isSelected = context.l10n.localeName == key;

    return InkWell(
      onTap: () {
        provideOnce<LocaleNotifier>(context).setLocale(Locale(key));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppPalette.white, width: 0.5),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppPalette.white : null,
        ),
        child: Text(
          text,
          style: AppTextStyle.h4(context).copyWith(
            color: isSelected ? AppPalette.black : AppPalette.white,
          ),
        ),
      ),
    );
  }
}
