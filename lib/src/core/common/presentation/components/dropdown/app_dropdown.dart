// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use_from_same_package

import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:base/src/core/common/exports/main_export.dart';

part 'view/dropdown_button.dart';
part 'view/utils.dart';
part 'view/dropdown_button_data.dart';

/// `AppDropDown` is a custom dropdown button that can be used to select a single value from a set of options.
class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    Key? key,
    this.initialOption,
    required this.hintText,
    required this.options,
    this.optionLabels,
    required this.onChanged,
    this.icon,
    this.width,
    this.height,
    this.fillColor,
    this.textStyle,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.margin,
    this.hidesUnderline = false,
    this.disabled = false,
    this.isRequired = false,
    this.onTap,
    this.disabledText,
    this.disabledTextStyle,
    required this.dropDownValue,
    this.validator,
    this.focusNode,
    this.suffixIcon,
    this.optionString,
    required this.onClear,
  }) : super(key: key);

  final T? initialOption;
  final String hintText;
  final String? disabledText;
  final List<T> options;
  final List<String>? optionLabels;
  final Function(T?) onChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Function()? onTap;
  final double? elevation;
  final double? borderWidth;
  final double? borderRadius;
  final String? Function(T?)? validator;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final bool hidesUnderline;
  final bool disabled;
  final T? dropDownValue;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final String? optionString;
  final Function()? onClear;
  final bool isRequired;

  @override
  State<AppDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<AppDropDown<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButtonFormField2<T>(
      value: widget.options.contains(widget.dropDownValue) ? widget.dropDownValue : null,
      focusNode: widget.focusNode,
      validator: widget.validator ?? (widget.isRequired ? (value) => value == null ? context.l10n.fieldIsRequired : null : null),
      items: widget.options
          .asMap()
          .entries
          .map(
            (option) => DropdownMenuItem<T>(
              value: option.value,
              child: Text(
                widget.optionLabels == null || widget.optionLabels!.length < option.key + 1
                    ? option.value.toString()
                    : widget.optionLabels![option.key],
                style: widget.textStyle,
              ),
            ),
          )
          .toList(),
      style: const TextStyle(overflow: TextOverflow.clip),
      customButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.optionString != null ? widget.optionString! : (widget.dropDownValue != null ? widget.dropDownValue.toString() : ""),
              style: widget.disabled ? widget.disabledTextStyle ?? widget.textStyle : widget.textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          widget.dropDownValue != null && widget.dropDownValue != "" && widget.onClear != null
              ? InkWell(
                  onTap: () {
                    widget.onClear?.call();
                  },
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: AppPalette.gray600,
                    size: 19,
                  ),
                )
              : const Icon(
                  Icons.expand_more_rounded,
                  color: AppPalette.gray800,
                  size: 18,
                ),
        ],
      ),
      dropdownStyleData: DropdownStyleData(
        elevation: widget.elevation?.toInt() ?? 0,
        width: widget.width,
        direction: DropdownDirection.center,
        decoration: BoxDecoration(
          color: widget.disabled ? context.theme.appColors.gray300 : widget.fillColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
          border: Border.all(
            color: widget.borderColor ?? context.theme.appColors.border,
            width: widget.borderWidth ?? 1.5,
          ),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        customHeights: List.generate(
          widget.options.length,
          (index) => 45,
        ),
        overlayColor: MaterialStateProperty.all(AppPalette.splash),
      ),
      onChanged: !widget.disabled
          ? (value) {
              widget.onChanged(value);
            }
          : null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintText: widget.hintText + (widget.isRequired ? " *" : ""),
        labelText: widget.hintText + (widget.isRequired ? " *" : ""),
        filled: true,
        fillColor: widget.disabled ? context.theme.appColors.gray300 : widget.fillColor ?? context.theme.appColors.scaffoldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.theme.appColors.border,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppPalette.danger,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.theme.appColors.border,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.theme.appColors.border,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.theme.appColors.primaryIcon,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppPalette.danger,
            width: 1.5,
          ),
        ),
        labelStyle: TextStyle(
          fontFamily: "Mulish",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          overflow: TextOverflow.fade,
          color: widget.disabled ? AppPalette.gray800 : context.theme.appColors.text,
        ),
        hintStyle: const TextStyle(
          fontFamily: "Mulish",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppPalette.grayText,
        ),
      ),
      isExpanded: true,
    );

    return SizedBox(
      width: widget.width,
      child: dropdownWidget,
    );
  }
}
