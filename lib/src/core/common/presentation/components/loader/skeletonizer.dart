import 'package:base/src/core/common/exports/main_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerLoader extends StatelessWidget {
  final Widget child;
  final bool isEnabled;
  const SkeletonizerLoader({super.key, required this.child, this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: context.theme.appColors.shimmerBase,
        highlightColor: context.theme.appColors.shimmerHighlight,
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ),
      containersColor: context.theme.appColors.shimmerBase,
      enabled: isEnabled,
      ignorePointers: true,
      child: child,
    );
  }
}
