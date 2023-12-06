import 'package:base/src/core/common/exports/main_export.dart';

/// [TabSwitchComponent] is a widget that allows you to switch between two tabs.
class TabSwitchComponent extends StatelessWidget {
  final int selectedIndex;
  final String firstTabTitle;
  final String secondTabTitle;
  final Function() onFirstTap;
  final Function() onSecondTap;
  const TabSwitchComponent({
    super.key,
    required this.selectedIndex,
    required this.onFirstTap,
    required this.onSecondTap,
    required this.firstTabTitle,
    required this.secondTabTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: context.theme.appColors.text,
                width: 1,
              ),
              color: context.theme.appColors.card,
              boxShadow: AppStyles.getBoxShadow(context),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.theme.appColors.card,
                boxShadow: AppStyles.getBoxShadow(context),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: selectedIndex == 0 ? 5 : 5,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        onTap: onFirstTap,
                        child: Ink(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: ShapeDecoration(
                            color: selectedIndex == 0 ? context.theme.appColors.text : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: selectedIndex == 0 ? context.theme.appColors.text : Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  firstTabTitle,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.h5(context).copyWith(
                                    fontSize: 13,
                                    color: selectedIndex == 0 ? context.theme.appColors.background : context.theme.appColors.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: selectedIndex == 1 ? 5 : 5,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        onTap: onSecondTap,
                        child: Ink(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: ShapeDecoration(
                            color: selectedIndex == 1 ? context.theme.appColors.text : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: selectedIndex == 1 ? context.theme.appColors.text : Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  secondTabTitle,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.h5(context).copyWith(
                                    fontSize: 13,
                                    color: selectedIndex == 1 ? context.theme.appColors.background : context.theme.appColors.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
