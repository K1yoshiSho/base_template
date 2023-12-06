import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// `CustomButton` is also button with customizable properties. It has `ButtonOptions` class

class CustomButton extends StatefulWidget {
  // Constructor for the widget.
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
    this.showLoadingIndicator = true,
  }) : super(key: key);

  // This is a constructor function for initializing the instance variables of the class `CustomButton`
  final String text;
  final Widget? icon;
  final IconData? iconData;
  final Function()? onPressed;
  final ButtonOptions options;
  final bool showLoadingIndicator;

  // Creates and returns a new instance of the state associated with this widget.
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

// Private state class for the CustomButton.
class _CustomButtonState extends State<CustomButton> {
  // A boolean flag that indicates if loading indicator should be shown or not.
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // Widget that contains button text with/without loading icon.
    Widget textWidget = loading
        ? Center(
            child: SizedBox(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.options.textStyle!.color ?? Colors.white,
                ),
              ),
            ),
          )
        : AutoSizeText(
            widget.text,
            style: widget.options.textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

// Function to be executed when button is pressed, taking into account if loading indicator should also be shown.
    final onPressed = widget.onPressed != null
        ? (widget.showLoadingIndicator
            ? () async {
                if (loading) {
                  return;
                }
                setState(() => loading = true);
                try {
                  await widget.onPressed!();
                } finally {
                  if (mounted) {
                    setState(() => loading = false);
                  }
                }
              }
            : () => widget.onPressed!())
        : null;

// Define the style of the button based on various states of Material.
    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          if (states.contains(MaterialState.hovered) && widget.options.hoverBorderSide != null) {
            return RoundedRectangleBorder(
              borderRadius: widget.options.borderRadius ?? BorderRadius.circular(8),
              side: widget.options.hoverBorderSide!,
            );
          }
          return RoundedRectangleBorder(
            borderRadius: widget.options.borderRadius ?? BorderRadius.circular(8),
            side: widget.options.borderSide ?? BorderSide.none,
          );
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) && widget.options.disabledTextColor != null) {
            return widget.options.disabledTextColor;
          }
          if (states.contains(MaterialState.hovered) && widget.options.hoverTextColor != null) {
            return widget.options.hoverTextColor;
          }
          return widget.options.textStyle?.color;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) && widget.options.disabledColor != null) {
            return widget.options.disabledColor;
          }
          if (states.contains(MaterialState.hovered) && widget.options.hoverColor != null) {
            return widget.options.hoverColor;
          }
          return widget.options.color;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return widget.options.splashColor;
        }
        return null;
      }),
      padding: MaterialStateProperty.all(widget.options.padding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0)),
      elevation: MaterialStateProperty.resolveWith<double?>(
        (states) {
          if (states.contains(MaterialState.hovered) && widget.options.hoverElevation != null) {
            return widget.options.hoverElevation!;
          }
          return widget.options.elevation;
        },
      ),
    );

// Return ElevatedButton with icon or a simple ElevatedButton based on whether the icon is provided.
    if (widget.icon != null || widget.iconData != null) {
      return SizedBox(
        height: widget.options.height,
        width: widget.options.width,
        child: ElevatedButton.icon(
          icon: Padding(
            padding: widget.options.iconPadding ?? EdgeInsets.zero,
            child: widget.icon ??
                Icon(
                  widget.iconData,
                  size: widget.options.iconSize,
                  color: widget.options.iconColor ?? widget.options.textStyle!.color,
                ),
          ),
          label: textWidget,
          onPressed: onPressed,
          style: style,
        ),
      );
    }

    return SizedBox(
      height: widget.options.height,
      width: widget.options.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: textWidget,
      ),
    );
  }
}

class ButtonOptions {
  const ButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
    this.hoverColor,
    this.hoverBorderSide,
    this.hoverTextColor,
    this.hoverElevation,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? hoverColor;
  final BorderSide? hoverBorderSide;
  final Color? hoverTextColor;
  final double? hoverElevation;
}
