import 'package:base/src/core/common/exports/main_export.dart';

/// `LoadingComponent` returns a CircularProgressIndicator widget with some customization.
class LoadingComponent extends StatelessWidget {
  // Constructor for the LoadingComponent.
  const LoadingComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns a CircularProgressIndicator widget with a strokeWidth of 3 and color set to primaryColor obtained from AppPalette.
    /// [RepaintBoundary] - Creates a widget that isolates repaints.
    return RepaintBoundary(
      child: CircularProgressIndicator(
        strokeWidth: 3, // Customize the width of the progress indicator.
        color: context.theme.appColors.primaryIcon, // Set the color of the progress indicator to primaryColor defined in AppPalette.
      ),
    );
  }
}
