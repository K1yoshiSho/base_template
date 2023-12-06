part of '../../../talker.dart';

class BaseBottomSheetW extends StatelessWidget {
  const BaseBottomSheetW({
    Key? key,
    required this.talkerScreenTheme,
    required this.child,
    required this.title,
  }) : super(key: key);

  final TalkerScreenTheme talkerScreenTheme;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final theme = context.theme;
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(
          top: mq.padding.top + mq.viewInsets.top + 50,
        ),
        padding: EdgeInsets.only(
          top: 20,
          bottom: mq.padding.bottom,
        ),
        decoration: BoxDecoration(
          color: talkerScreenTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8).copyWith(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.headlineSmall?.copyWith(color: talkerScreenTheme.textColor),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close_rounded,
                      color: talkerScreenTheme.textColor,
                    ),
                  ),
                ],
              ),
            ),
            AppDivider(
              color: talkerScreenTheme.textColor,
              endIndent: 10,
              indent: 10,
            ),
            child,
          ],
        ),
      ),
    );
  }
}