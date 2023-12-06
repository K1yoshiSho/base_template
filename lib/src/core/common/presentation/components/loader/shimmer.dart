import 'package:base/src/core/common/exports/main_export.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  final Widget child;
  final bool isEnabled;
  final double? borderRadius;

  const ShimmerWrapper({super.key, required this.child, this.isEnabled = true, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return isEnabled
        ? Shimmer.fromColors(
            baseColor: context.theme.appColors.shimmerBase,
            highlightColor: context.theme.appColors.shimmerHighlight,
            period: const Duration(milliseconds: 2000),
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.appColors.shimmerBase,
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
              ),
              child: child,
            ),
          )
        : child;
  }
}
