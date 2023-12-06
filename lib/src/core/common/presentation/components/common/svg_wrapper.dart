import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWrapper extends StatelessWidget {
  final String name;
  final Color? color;
  final double? width;
  final double? height;

  const SvgWrapper({
    super.key,
    required this.name,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
