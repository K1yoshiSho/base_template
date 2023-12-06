import 'package:base/src/core/common/exports/main_export.dart';

/// This function returns a `FloatingActionButton` with the specified parameters.

FloatingActionButton buildFAB(BuildContext context, VoidCallback onPressed, IconData? iconPath) {
  // Creates and returns a new FloatingActionButton widget.
  return FloatingActionButton(
    // Sets the background color of the button.
    backgroundColor: AppPalette.primaryColor,
    // Sets the splash color (when the button is tapped) of the button.
    splashColor: AppPalette.splashMButton,
    // Sets the elevation of the button.
    elevation: 1,
    // Sets the callback function to be executed when the button is pressed.
    onPressed: onPressed,
    // Sets the child widget to display within the button. Uses an image asset if iconPath is not null, otherwise uses a default icon.
    child: Icon(
      iconPath ?? LocaIcons.plus,
      color: Colors.white,
      size: 24,
    ),
  );
}

/// This function returns a `FloatingActionButton` with the extended property.

FloatingActionButton buildExtendedFAB({
  required BuildContext context,
  Function()? onPressed,
  Widget? icon,
  String? iconPath,
  required String labelText,
}) {
  // Creates and returns a new FloatingActionButton
  return FloatingActionButton.extended(
    onPressed: onPressed, // Assigns the onPressed callback function to the button.
    elevation: 0, // Sets the elevation of the button (default is 6).
    label: Text(
      labelText, // Assigns the text to display on the button.
      style: AppTextStyle.b3(context).copyWith(color: Colors.white), // Applies styling to the text.
    ),
    icon: icon ?? (iconPath != null ? Image.asset(iconPath) : null), // Assigns the widget or image path to use as the button's icon.
    backgroundColor: AppPalette.primaryColor, // Assigns the background color of the button.
  );
}
