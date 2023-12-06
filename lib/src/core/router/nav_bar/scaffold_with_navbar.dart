import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:base/src/core/common/exports/main_export.dart';

// ignore: must_be_immutable
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = context.l10n;

    return KeyboardVisibilityBuilder(builder: (context, isVisible) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: isVisible
                      ? 8
                      : Platform.isIOS
                          ? 85
                          : 75),
              child: navigationShell,
            ),
          ],
        ),
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: SizedBox(
            height: Platform.isIOS ? 95 : 75,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              enableFeedback: false,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              useLegacyColorScheme: false,
              backgroundColor: context.theme.appColors.card,
              selectedItemColor: AppPalette.mainYellow,
              unselectedItemColor: AppPalette.gray700,
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) {
                navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 8),
                    child: Icon(
                      LocaIcons.outlined_home,
                      size: 18,
                    ),
                  ),
                  label: localizations.home,
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 8),
                    child: Icon(
                      LocaIcons.outlined_globe,
                      size: 18,
                    ),
                  ),
                  label: localizations.feed,
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 8),
                    child: Icon(
                      LocaIcons.outlined_user,
                      size: 18,
                    ),
                  ),
                  label: localizations.profile,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
