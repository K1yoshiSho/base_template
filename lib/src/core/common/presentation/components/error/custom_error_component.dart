import 'package:base/src/core/common/exports/main_export.dart';
import 'package:expandable/expandable.dart';

/// `CustomErrorComponent` is a widget that shows error message and on tap it call again our function.

class CustomErrorComponent extends StatefulWidget {
  final String errorStr;
  final DioException? error;
  final Function()? onTap;

  const CustomErrorComponent({
    Key? key,
    required this.errorStr,
    this.error,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomErrorComponent> createState() => _CustomErrorComponentState();
}

class _CustomErrorComponentState extends State<CustomErrorComponent> {
  late ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController(initialExpanded: false);
  }

  @override
  Widget build(BuildContext context) {
    final bodySmallStyle = context.theme.textTheme.bodySmall;
    final bodyMediumStyle = context.theme.textTheme.bodyMedium;
    final AppLocalizations appLocalizations = context.l10n;

    final errorText = AutoSizeText(
      widget.errorStr,
      textAlign: TextAlign.center,
    );

    final expandedPanel = StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        final controller2 = ExpandableController.of(context, rebuildOnChange: true);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ErrorInfoRow(
                title: '${appLocalizations.statusCode}: ',
                error: widget.error!.response?.statusCode.toString() ?? context.l10n.noValues,
              ),
              _ErrorInfoRow(
                title: '${appLocalizations.url}: ',
                error: widget.error!.requestOptions.uri.toString().replaceAll(HttpQuery.baseUrl, ''),
              ),
              _ErrorInfoRow(
                title: '${appLocalizations.method}: ',
                error: widget.error!.requestOptions.method,
              ),
              if (controller2!.expanded)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        controller2.toggle();
                      },
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          AutoSizeText(
                            context.l10n.hide,
                            style: bodySmallStyle?.copyWith(fontSize: 14, color: AppPalette.grayText),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.error == null) errorText,
            if (widget.error != null)
              Column(children: [
                Center(
                  child: AutoSizeText(
                    widget.errorStr,
                    style: bodyMediumStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ExpandableNotifier(
                    controller: controller,
                    child: ExpandablePanel(
                      controller: controller,
                      collapsed: Builder(builder: (context) {
                        return (!controller.expanded)
                            ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          controller.toggle();
                                        },
                                        borderRadius: BorderRadius.circular(4),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                                            AutoSizeText(
                                              '${context.l10n.showMore}...',
                                              style: bodySmallStyle?.copyWith(fontSize: 14, color: AppPalette.grayText),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox();
                      }),
                      expanded: expandedPanel,
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: false,
                        useInkWell: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        inkWellBorderRadius: BorderRadius.circular(15),
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: false,
                      ),
                    ),
                  ),
                ),
              ]),
            if (widget.onTap != null)
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Ink(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: AppPalette.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: widget.onTap,
                      child: const Center(
                        child: Icon(
                          LocaIcons.outlined_rotate_right,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// [ErrorInfoRow] is a stateless widget that displays error information.
///
class _ErrorInfoRow extends StatelessWidget {
  const _ErrorInfoRow({
    Key? key,
    required this.error,
    required this.title,
  }) : super(key: key);

  final String error;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: AppTextStyle.b3(context),
          ),
          Expanded(
            child: AutoSizeText(
              error,
              style: AppTextStyle.b3(context),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
