import 'package:base/src/core/common/exports/main_export.dart';

class AppDatePicker extends StatelessWidget {
  final AppLocalizations appLocalizations;
  final String? title;
  final double? width;
  final TextEditingController controller;
  final Function() onRemove;
  final bool isRequired;
  final DateTime? initialDate;
  final Function() ifSelectedNull;
  final Function(DateTime) ifSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  const AppDatePicker({
    super.key,
    this.width,
    required this.controller,
    required this.onRemove,
    this.isRequired = false,
    required this.appLocalizations,
    this.initialDate,
    required this.ifSelectedNull,
    required this.ifSelected,
    this.title,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width * 0.6,
      child: OutlinedTextfield(
        hintText: (title ?? appLocalizations.date_of_birth) + (isRequired ? " *" : ""),
        textController: controller,
        readOnly: true,
        suffixIcon: (controller.text.isEmpty)
            ? const Icon(
                Icons.expand_more_rounded,
                color: AppPalette.gray800,
                size: 18,
              )
            : IconButton(
                splashRadius: 20,
                style: AppStyles.iconButtonStyle(context),
                iconSize: 20,
                onPressed: () {
                  onRemove();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: AppPalette.gray600,
                  size: 19,
                ),
              ),
        validator: (value) {
          if (value!.isEmpty && isRequired) {
            return appLocalizations.fieldIsRequired;
          }
          return null;
        },
        onTap: () {
          showDatePicker(
            context: context,
            useRootNavigator: true,
            initialDate: initialDate ?? DateTime.now(),
            // builder: (context, child) {
            //   return Theme(
            //     data: AppTheme.dark.copyWith(),
            //     child: child!,
            //   );
            // },
            firstDate: firstDate ?? DateTime.now(),
            lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365 * 150)),
          ).then((value) {
            if (value == null) {
              ifSelectedNull();
            } else {
              ifSelected(value);
            }
          });
        },
        prefixIcon: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            LocaIcons.outlined_calendar,
            size: 18,
          ),
        ),
      ),
    );
  }
}
