import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/state/blocs/device_info/device_info_bloc.dart';

@immutable
class ChooseLanguage extends StatefulWidget {
  final VoidCallback? onChanged;
  const ChooseLanguage({Key? key, this.onChanged}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    final localeNotifier = provideOnce<LocaleNotifier>(context);
    return Row(
      children: [
        _LanguageButton(
          localeNotifier: localeNotifier,
          languageCode: 'en',
          title: context.l10n.en,
          isSelected: context.l10n.localeName == 'en',
          onChanged: () => widget.onChanged?.call(),
        ),
        const Gap(8),
        _LanguageButton(
          localeNotifier: localeNotifier,
          languageCode: 'ru',
          title: context.l10n.ru,
          isSelected: context.l10n.localeName == 'ru',
          onChanged: () => widget.onChanged?.call(),
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String title;
  final String languageCode;
  final Function()? onChanged;
  final LocaleNotifier localeNotifier;
  final bool isSelected;
  const _LanguageButton({
    required this.title,
    required this.languageCode,
    required this.onChanged,
    required this.isSelected,
    required this.localeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          localeNotifier.setLocale(Locale(languageCode));
          provideOnce<DeviceInfoBloc>(context).add(const SendDeviceInfoEvent());
          onChanged?.call();
        },
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppPalette.white),
            color: isSelected ? AppPalette.white : null,
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.h4(context).copyWith(
                color: isSelected ? AppPalette.black : AppPalette.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
