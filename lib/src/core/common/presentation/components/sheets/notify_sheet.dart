import 'package:base/src/core/common/exports/main_export.dart';

class NotifyBottomSheet extends StatefulWidget {
  final String text;
  final String? buttonText;
  final String content;
  final Function()? onPressed;
  final bool isInfo;
  final bool isError;
  final double height;

  const NotifyBottomSheet({
    super.key,
    required this.text,
    this.buttonText,
    required this.content,
    this.onPressed,
    this.isInfo = true,
    this.isError = false,
    this.height = 350,
  });

  static void close(BuildContext context) {
    context.pop();
  }

  static void show(
    BuildContext context, {
    required String text,
    String? buttonText,
    required String content,
    Function()? onPressed,
    bool isInfo = true,
    bool isError = false,
    double height = 350,
    Function()? onClosed,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: false,
      backgroundColor: Colors.transparent,
      builder: (context) => NotifyBottomSheet(
        text: text,
        content: content,
        buttonText: buttonText,
        onPressed: onPressed,
        isInfo: isInfo,
        isError: isError,
        height: height,
      ),
    ).then((value) {
      onClosed?.call();
    });
  }

  @override
  State<NotifyBottomSheet> createState() => _LCoinsBottomSheetState();
}

class _LCoinsBottomSheetState extends State<NotifyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
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
            height: widget.height,
            decoration: const BoxDecoration(
              color: AppPalette.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16.0, top: 10.0, end: 16.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            widget.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.h2(context),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: IconButton(
                            icon: const Icon(
                              LocaIcons.outlined_cross_circle,
                              size: 40,
                              color: AppPalette.black,
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16.0,
                      top: 4.0,
                      end: 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Gap(24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.content,
                                        style: AppTextStyle.b1(context),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Visibility(
                              visible: widget.buttonText != null && widget.onPressed != null && widget.isError,
                              child: _BottomSheetButton(
                                onPressed: () {
                                  widget.onPressed?.call();
                                  setState(() {});
                                },
                                text: widget.buttonText ?? '',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _BottomSheetButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const _BottomSheetButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(24),
        AppButton(
          onPressed: onPressed,
          text: text,
        ),
      ],
    );
  }
}
