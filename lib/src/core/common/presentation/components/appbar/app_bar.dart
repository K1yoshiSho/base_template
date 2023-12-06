import 'package:base/src/core/common/exports/main_export.dart';

/// This function return custom `AppBar` with specific properties

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final Widget? actionIcon;
  final Function()? action;
  final Function()? onBack;
  final bool leadingEnabled;

  const PrimaryAppBar({
    Key? key,
    this.title,
    this.centerTitle = false,
    this.actionIcon,
    this.action,
    this.onBack,
    this.leadingEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      title: title != null
          ? AutoSizeText(
              title!.replaceAll(
                "not found",
                context.l10n.no,
              ),
              style: AppTextStyle.h2(context),
              maxLines: 1,
              minFontSize: 16,
            )
          : null,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      leading: leadingEnabled
          ? IconButton(
              splashRadius: 18,
              style: AppStyles.iconButtonStyle(context),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: context.theme.appColors.text,
                size: 35,
              ),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                }
                if (onBack != null) {
                  onBack!();
                }
              },
            )
          : null,
      actions: [
        if (actionIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
              splashRadius: 18,
              style: AppStyles.iconButtonStyle(context),
              color: context.theme.appColors.text,
              onPressed: action,
              icon: actionIcon!,
            ),
          ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FlexibleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle = false;
  final Widget? actionIcon;
  final Function()? action;
  final Function()? onBack;
  final bool leadingEnabled = true;
  final Widget? leadingIcon;

  const FlexibleAppBar({
    super.key,
    this.title,
    this.actionIcon,
    this.action,
    this.onBack,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      toolbarHeight: 50,
      flexibleSpace: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 1, left: 4, right: 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      leadingEnabled
                          ? leadingIcon ??
                              IconButton(
                                splashRadius: 18,
                                style: AppStyles.iconButtonStyle(context),
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  size: 35,
                                  color: context.theme.appColors.text,
                                ),
                                onPressed: () {
                                  if (context.canPop()) {
                                    context.pop();
                                  }
                                  if (onBack != null) {
                                    onBack!();
                                  }
                                },
                              )
                          : const SizedBox(),
                      const Gap(4),
                      title != null
                          ? Expanded(
                              child: Text(
                                title!.replaceAll(
                                  "not found",
                                  context.l10n.no,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.h2(context),
                              ),
                            )
                          : const SizedBox(),
                      const Gap(4),
                    ],
                  ),
                ),
                actionIcon ?? const SizedBox(),
              ],
            ),
          ),
          const AppDivider(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
