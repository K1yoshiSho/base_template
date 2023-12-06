part of '../../talker.dart';

class TalkerSettingsCardW extends StatelessWidget {
  const TalkerSettingsCardW({
    Key? key,
    required this.talkerScreenTheme,
    required this.title,
    required this.enabled,
    required this.onChanged,
    this.canEdit = true,
  }) : super(key: key);

  final String title;
  final bool enabled;
  final Function(bool enabled) onChanged;
  final TalkerScreenTheme talkerScreenTheme;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: canEdit ? 1 : 0.7,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8.0, left: 0),
        child: TalkerBaseCardW(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0).copyWith(right: 0),
          margin: EdgeInsets.zero,
          color: context.theme.appColors.scaffoldBackground,
          child: ListTile(
            shape: const RoundedRectangleBorder(side: BorderSide(color: AppPalette.primaryColor), borderRadius: BorderRadius.all(Radius.circular(8))),
            dense: true,
            title: Text(
              title,
              style: TextStyle(
                color: talkerScreenTheme.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Switch.adaptive(
              value: enabled,
              trackOutlineColor: MaterialStateColor.resolveWith((states) {
                if (canEdit && states.contains(MaterialState.selected)) {
                  return AppPalette.accent200;
                }
                return Colors.transparent;
              }),
              trackColor: MaterialStateProperty.resolveWith((states) {
                if (canEdit && states.contains(MaterialState.selected)) {
                  return AppPalette.accent200;
                }
                return AppPalette.gray600;
              }),
              onChanged: canEdit ? onChanged : null,
            ),
          ),
        ),
      ),
    );
  }
}
