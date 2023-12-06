import 'package:base/src/core/common/exports/main_export.dart';

/// `AppCheckBox` is a widget that represents a checkbox with a custom design.

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final Function(bool?)? onChanged;

  // Builds the widget tree for this widget.
  @override
  Widget build(BuildContext context) {
    // Returns a Gap widget that constrains its child to a specific height and width.
    return SizedBox(
      height: 20,
      width: 20,
      child: Checkbox(
        value: value, // Sets the current value of the checkbox.
        activeColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2), // Sets the border radius of the checkbox.
          side: BorderSide(
            color: context.theme.appColors.gray300, // Sets the border color of the checkbox.
          ),
        ),

        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(
            width: 1.0,
            color: AppPalette.white,
          ),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded, // Configures the size of the tap target area.
        onChanged: onChanged, // Assigns the onChanged callback function to the checkbox.
      ),
    );
  }
}
