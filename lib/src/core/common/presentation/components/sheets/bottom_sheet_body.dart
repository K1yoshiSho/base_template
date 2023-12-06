import 'package:base/src/core/common/exports/main_export.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget body;
  final Widget? bottom;
  final String title;
  final double? height;
  final bool isWithoutTitle;
  final Color backgroundColor;

  const AppBottomSheet({
    super.key,
    required this.body,
    this.bottom,
    this.height,
    this.isWithoutTitle = false,
    required this.title,
    this.backgroundColor = AppPalette.black,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return RepaintBoundary(
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: height ?? screenSize.height * 0.55,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16.0, top: 18, end: 16.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Visibility(
                        replacement: body,
                        visible: !isWithoutTitle,
                        child: AutoSizeText(
                          title,
                          maxLines: 2,
                          minFontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.h2(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: IconButton(
                        icon: const Icon(
                          LocaIcons.outlined_cross_circle,
                          size: 40,
                          color: AppPalette.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: !isWithoutTitle,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16.0, top: 4.0, end: 16.0, bottom: 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        body,
                        bottom ?? const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
