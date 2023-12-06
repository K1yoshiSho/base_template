import 'package:base/src/core/common/exports/main_export.dart';

/// `AppButton` is a custom button widget.

class AppButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Color? disableColor;
  final bool? isOutline;
  final bool? isDisabled;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final int? fontSize;
  final Widget? iconRight;
  final bool? isLoading;
  final TextStyle? textStyle;
  final bool hasBorder;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.isOutline,
    this.isDisabled,
    this.fontWeight,
    this.height,
    this.width,
    this.fontSize,
    this.iconRight,
    this.isLoading,
    this.textStyle,
    this.hasBorder = false,
    this.disableColor = AppPalette.lightGrey,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
// A boolean flag that indicates if loading indicator should be shown or not.
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = widget.isLoading ?? false;
  }

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    isLoading = widget.isLoading ?? false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: widget.height ?? 50,
        width: widget.width ?? MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: widget.isDisabled == true
              ? widget.disableColor
              : widget.isOutline == true
                  ? widget.buttonColor ?? Colors.transparent
                  : widget.buttonColor ?? AppPalette.greenSuccessColor,
          border: Border.all(
            color: (widget.isOutline == true && widget.hasBorder) ? widget.textColor ?? context.theme.appColors.text : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          splashColor: AppPalette.highlight,
          highlightColor: AppPalette.highlight,
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onPressed != null && widget.isDisabled != true
              ? () async {
                  if (isLoading) {
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await widget.onPressed!();
                  } finally {
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (isLoading == true)
                  ? Center(
                      child: SizedBox(
                        width: 23,
                        height: 23,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            widget.textColor ?? AppPalette.black,
                          ),
                        ),
                      ),
                    )
                  : AutoSizeText(
                      widget.text,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.textStyle ??
                          TextStyle(
                            color: (widget.isDisabled ?? false)
                                ? AppPalette.darkGrey
                                : widget.isOutline == true
                                    ? widget.textColor ?? context.theme.appColors.text
                                    : widget.textColor ?? AppPalette.black,
                            fontSize: widget.fontSize?.toDouble() ?? 14,
                            fontWeight: widget.fontWeight ?? FontWeight.w900,
                          ),
                    ),
              widget.iconRight ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
