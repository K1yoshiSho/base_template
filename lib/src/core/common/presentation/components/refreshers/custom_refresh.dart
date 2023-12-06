import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

import 'package:flutter/rendering.dart';
import 'package:base/src/core/common/exports/main_export.dart';

class EasyRefresher extends StatefulWidget {
  final Widget child;
  final IndicatorController controller;
  final Future<void> Function() onRefresh;
  const EasyRefresher({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.controller,
  }) : super(key: key);

  @override
  State<EasyRefresher> createState() => _EasyRefresher();
}

class _EasyRefresher extends State<EasyRefresher> with SingleTickerProviderStateMixin {
  ScrollDirection prevScrollDirection = ScrollDirection.idle;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: 170,
      controller: widget.controller,
      onRefresh: () {
        return widget.onRefresh();
      },
      durations: const RefreshIndicatorDurations(
        completeDuration: Duration(seconds: 1),
      ),
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, _) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                    top: 10,
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50 * controller.value,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: controller.isLoading,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor: AlwaysStoppedAnimation<Color>(AppPalette.randomColor),
                                            ),
                                          ),
                                          const Gap(16),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.isComplete || controller.isFinalizing,
                                      child: const Row(
                                        children: [
                                          Icon(
                                            LocaIcons.filled_check,
                                            size: 18,
                                            color: AppPalette.white,
                                          ),
                                          Gap(16),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.isDragging,
                                      child: const Row(
                                        children: [
                                          Icon(
                                            LocaIcons.filled_arrow_down,
                                            size: 18,
                                            color: AppPalette.white,
                                          ),
                                          Gap(16),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.isArmed || controller.isSettling,
                                      child: const Row(
                                        children: [
                                          Icon(
                                            LocaIcons.filled_rotate_right,
                                            size: 18,
                                            color: AppPalette.white,
                                          ),
                                          Gap(16),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      getRefresherText(context: context, controller: controller),
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.b3(context).copyWith(color: AppPalette.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                AnimatedBuilder(
                  builder: (context, _) {
                    return Transform.translate(
                      offset: Offset(0.0, controller.value * 50),
                      child: child,
                    );
                  },
                  animation: controller,
                ),
              ],
            );
          },
        );
      },
      child: widget.child,
    );
  }
}

String getRefresherText({required BuildContext context, required IndicatorController controller}) {
  if (controller.isDragging) {
    return context.l10n.idleRefresh;
  } else if (controller.isFinalizing) {
    return context.l10n.updated;
  } else if (controller.isCanceling) {
    return context.l10n.nextTime;
  } else if (controller.isLoading) {
    return context.l10n.loading;
  } else if (controller.isComplete) {
    return context.l10n.updated;
  } else {
    return context.l10n.letForUpdate;
  }
}
