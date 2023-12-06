import 'package:base/src/core/common/exports/main_export.dart';

class MultiBlocWrapper extends StatelessWidget {
  final Widget child;
  final int blocsCount;
  final int failuresCount;
  final Widget failureWidget;
  const MultiBlocWrapper({
    super.key,
    required this.child,
    required this.blocsCount,
    required this.failuresCount,
    required this.failureWidget,
  });

  @override
  Widget build(BuildContext context) {
    return (blocsCount == failuresCount) ? failureWidget : child;
  }
}
