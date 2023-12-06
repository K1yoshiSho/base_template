import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:base/src/core/common/exports/main_export.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  const AppLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SpinKitChasingDots(
              color: color ?? AppPalette.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
