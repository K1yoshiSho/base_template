import 'package:base/src/core/common/exports/main_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Refresher extends StatelessWidget {
  final RefreshController controller;
  final ScrollController? scrollController;
  final Widget child;
  final Function() onRefresh;
  final Function() onLoad;
  final bool enableHeader;
  final bool enableFooter;
  const Refresher({
    super.key,
    required this.controller,
    required this.child,
    required this.onRefresh,
    required this.onLoad,
    required this.enableHeader,
    required this.enableFooter,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return SmartRefresher(
      controller: controller,
      scrollController: scrollController,
      enablePullUp: false,
      enablePullDown: true,
      primary: scrollController != null ? false : true,
      onRefresh: enableHeader
          ? () {
              onRefresh();
            }
          : null,
      onLoading: enableFooter
          ? () async {
              onLoad();
            }
          : null,
      header: enableHeader
          ? ClassicHeader(
              refreshStyle: RefreshStyle.Follow,
              textStyle: AppTextStyle.b3(context).copyWith(fontSize: 14),
              idleText: appLocalizations.idleRefresh,
              refreshingText: appLocalizations.loading,
              releaseText: appLocalizations.letForUpdate,
              completeText: appLocalizations.updated,
              failedText: appLocalizations.error,
              idleIcon: const Icon(LocaIcons.outlined_arrow_down),
              releaseIcon: const Icon(LocaIcons.filled_rotate_right),
              completeIcon: const Icon(LocaIcons.filled_check),
              failedIcon: const Icon(LocaIcons.outlined_exclamation),
              refreshingIcon: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppPalette.randomColor,
                ),
              ),
            )
          : null,
      footer: enableFooter
          ? ClassicFooter(
              textStyle: AppTextStyle.b3(context).copyWith(
                fontSize: 14,
                color: AppPalette.gray700,
              ),
              failedText: appLocalizations.error,
            )
          : null,
      child: child,
    );
  }
}
