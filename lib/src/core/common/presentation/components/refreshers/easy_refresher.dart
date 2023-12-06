import 'package:base/src/core/common/exports/main_export.dart';
import 'package:easy_refresh/easy_refresh.dart';

class EasyRefreshWrapper extends StatelessWidget {
  final EasyRefreshController controller;
  final Widget child;
  final Function() onRefresh;
  final Function() onLoad;
  final bool enableHeader;
  final bool enableFooter;
  const EasyRefreshWrapper(
      {super.key,
      required this.controller,
      required this.child,
      required this.onRefresh,
      required this.onLoad,
      required this.enableHeader,
      required this.enableFooter});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Material(
      color: Colors.transparent,
      child: EasyRefresh(
        controller: controller,
        callLoadOverOffset: 5,
        canRefreshAfterNoMore: true,
        simultaneously: true,
        onRefresh: enableHeader
            ? () {
                onRefresh();
              }
            : null,
        onLoad: enableFooter
            ? () async {
                onLoad();
              }
            : null,
        header: enableHeader
            ? ClassicHeader(
                textStyle: AppTextStyle.b3(context).copyWith(
                  fontSize: 14,
                  color: AppPalette.gray700,
                ),
                messageStyle: AppTextStyle.b3(context).copyWith(
                  fontSize: 12,
                  color: AppPalette.gray700,
                ),
                iconTheme: const IconThemeData(
                  color: AppPalette.gray700,
                ),
                dragText: appLocalizations.idleRefresh,
                armedText: appLocalizations.letForUpdate,
                readyText: appLocalizations.loading,
                processingText: appLocalizations.loading,
                processedText: appLocalizations.updated,
                noMoreText: appLocalizations.noDataToDownload,
                failedText: appLocalizations.error,
                messageText: "",
                showMessage: false,
              )
            : null,
        footer: enableFooter
            ? ClassicFooter(
                safeArea: false,
                textStyle: AppTextStyle.b3(context).copyWith(
                  fontSize: 14,
                  color: AppPalette.gray700,
                ),
                messageStyle: AppTextStyle.b3(context).copyWith(
                  fontSize: 12,
                  color: AppPalette.gray700,
                ),
                iconTheme: const IconThemeData(
                  color: AppPalette.gray700,
                ),
                position: IndicatorPosition.locator,
                pullIconBuilder: (context, state, animation) {
                  if (state.result == IndicatorResult.fail) {
                    return const Icon(LocaIcons.outlined_exclamation);
                  } else if (state.result == IndicatorResult.success) {
                    return const Icon(LocaIcons.filled_check);
                  } else if (state.result == IndicatorResult.noMore) {
                    return const Icon(LocaIcons.filled_check);
                  } else if (state.result == IndicatorResult.fail) {
                    return const Icon(LocaIcons.outlined_exclamation);
                  } else {
                    return const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppPalette.mainYellow,
                      ),
                    );
                  }
                },
                dragText: appLocalizations.idleRefresh,
                armedText: appLocalizations.letForUpdate,
                readyText: appLocalizations.loading,
                processingText: appLocalizations.loading,
                processedText: appLocalizations.updated,
                noMoreText: appLocalizations.noDataToDownload,
                failedText: appLocalizations.error,
                messageText: appLocalizations.lastUpdate("%T"),
                showMessage: false,
              )
            : null,
        child: child,
      ),
    );
  }
}
