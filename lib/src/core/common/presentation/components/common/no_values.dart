import 'package:base/src/core/common/exports/main_export.dart';

/// `NoValuesComponent` that returns a custom widget. It used when data is empty.

class NoValuesComponent extends StatelessWidget {
  // Constructor for the NoValuesComponent. It takes a string value to display as the message.
  const NoValuesComponent({
    Key? key,
    required this.text, // The message to be displayed in the Text widget.
  }) : super(key: key);

  final String text; // The message to be displayed

  @override
  Widget build(BuildContext context) {
    // Return a Column widget with two children- Image and Text widgets.
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Display an image from Assets with the width of 35% of the screen's width.
        // Image.asset(
        //   AppImages.emptyDocs,
        //   width: MediaQuery.sizeOf(context).width * 0.35,
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
          child: Text(
            // Display the text value passed to the constructor with some customization
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.b3(context).copyWith(color: AppPalette.gray600, fontSize: 14), // Customize the font size and color of the text.
          ),
        ),
      ],
    );
  }
}

class NoValuesComponentWithPadding extends StatelessWidget {
  final String? text;
  const NoValuesComponentWithPadding({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.theme.appColors.card,
              boxShadow: AppStyles.getBoxShadow(context),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: NoValuesComponent(
                text: text ?? context.l10n.noValues,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
