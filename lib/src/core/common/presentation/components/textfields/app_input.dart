import 'package:base/src/core/common/exports/main_export.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPaging;
  final TextStyle? style;
  final double? textSize;
  final Color? textColor;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? borderColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool showClearIcon;
  final bool? enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onTapOutside;
  final int? minLines;
  final int? maxLines;

  const AppInput({
    super.key,
    this.controller,
    this.focusNode,
    this.contentPaging,
    this.style,
    this.textSize,
    this.textColor,
    this.fillColor,
    this.cursorColor,
    this.hintText,
    this.hintStyle,
    this.prefixWidget,
    this.suffixWidget,
    this.showClearIcon = false,
    this.enabled,
    this.readOnly = false,
    this.inputFormatters,
    this.borderColor,
    this.onChanged,
    this.onTap,
    this.minLines,
    this.onTapOutside,
    this.maxLines,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        widget.onTap?.call();
      },
      onTapOutside: (event) {
        widget.onTapOutside?.call();
      },
      controller: controller,
      minLines: widget.minLines,
      maxLines: widget.minLines != null ? widget.maxLines ?? 6 : null,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      onChanged: (value) => widget.onChanged?.call(value),
      cursorColor: AppPalette.randomColor,
      inputFormatters: widget.inputFormatters,
      style: widget.style ?? AppTextStyle.b2(context),
      decoration: InputDecoration(
        filled: true,
        helperStyle: AppTextStyle.b2(context).copyWith(color: AppPalette.lightGrey),
        fillColor: widget.fillColor ?? Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? AppPalette.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? AppPalette.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? AppTextStyle.b2(context).copyWith(color: AppPalette.lightGrey),
        contentPadding: widget.contentPaging ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        prefixIcon: widget.prefixWidget,
        suffixIcon: buildSuffixIcon(),
      ),
    );
  }

  Widget? buildSuffixIcon() {
    if (widget.suffixWidget != null) {
      return widget.suffixWidget;
    }
    if (widget.showClearIcon) {
      if (controller.text.isNotEmpty) {
        return defaultClearFieldWidget;
      }
    }
    return null;
  }

  Widget get defaultClearFieldWidget => InkWell(
        child: const Icon(
          Icons.cancel_rounded,
          color: AppPalette.blackTextColor3,
        ),
        onTap: () {
          controller.clear();
        },
      );
}
