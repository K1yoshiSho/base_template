import 'package:base/src/core/common/exports/main_export.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:base/src/core/common/presentation/screens/about_screen.dart';
import 'package:base/src/core/common/presentation/screens/all_media_full_screen.dart';
import 'package:base/src/core/common/presentation/screens/fullscreen_slider.dart';
import 'package:base/src/core/common/presentation/screens/all_media_screen.dart';
import 'package:base/src/core/common/presentation/screens/initial_screen.dart';
import 'package:base/src/core/resource/domain/models/media.dart';
import 'package:base/src/features/talker/talker.dart';

/// [Models]

export 'package:go_router/go_router.dart';

/// This line declares a global key variable which is used to access the [NavigatorState] object associated with a widget.

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeSectionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeSection');

/// This function returns a [CustomTransitionPage] widget with default fade animation.

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

String? getCurrentPath() {
  if (navigatorKey.currentContext != null) {
    final GoRouterDelegate routerDelegate = GoRouter.of(navigatorKey.currentContext!).routerDelegate;
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  } else {
    return null;
  }
}

/// This function returns a [NoTransitionPage] widget with no animation.

CustomTransitionPage buildPageWithNoTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return NoTransitionPage<T>(
    key: state.pageKey,
    child: child,
  );
}

/// This function returns a dynamic [Page] widget based on the input parameters.
/// It uses the '[buildPageWithDefaultTransition]' function to create a page with a default [fade animation].

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(Widget child) => (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };

/// [createRouter] is a factory function that creates a [GoRouter] instance with all routes.

GoRouter createRouter() {
  return GoRouter(
    initialLocation: InitialScreen.routePath,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,

    // extraCodec: GeneralModelCodec(),
    observers: [
      TalkerRouteObserver(dependenciesContainer.talker),
      HeroController(),
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    errorPageBuilder: (context, state) {
      final error = state.matchedLocation;
      return CupertinoPage(
        child: Scaffold(
          appBar: PrimaryAppBar(
            leadingEnabled: false,
            title: context.l10n.error,
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText.rich(
                        TextSpan(
                          text: "${context.l10n.pageNotFound}: ",
                          children: [
                            TextSpan(text: error, style: AppTextStyle.h3(context).copyWith(color: AppPalette.randomColor), children: [
                              TextSpan(
                                text: " ${context.l10n.notFound}".toLowerCase(),
                                style: AppTextStyle.h3(context),
                              ),
                            ]),
                          ],
                        ),
                        style: AppTextStyle.h3(context),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 16,
                        maxFontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppButton(
                  text: context.l10n.goToHome,
                  onPressed: () {
                    navigatorKey.currentContext?.goNamed(InitialScreen.name);
                  },
                ),
              ),
              const Gap(50),
            ],
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        name: InitialScreen.name,
        path: InitialScreen.routePath,
        pageBuilder: (context, pathParameters) => const CupertinoPage(
          child: InitialScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: navigatorKey,
        name: LocaLoggerScreen.name,
        path: LocaLoggerScreen.routePath,
        pageBuilder: (context, pathParameters) {
          Map<String, dynamic>? args = pathParameters.extra as Map<String, dynamic>?;
          return CupertinoPage(
            child: LocaLoggerScreen(
              talker: args?[LocaLoggerScreen.paramTalker] as Talker,
              appBarTitle: args?[LocaLoggerScreen.paramTitle] as String? ?? "Manida",
              theme: args?[LocaLoggerScreen.paramTheme] as TalkerScreenTheme? ?? const TalkerScreenTheme(),
              itemsBuilder: args?[LocaLoggerScreen.paramItemBuilder] as Widget Function(BuildContext, TalkerDataInterface)?,
            ),
          );
        },
      ),
      GoRoute(
        name: AboutScreen.name,
        path: AboutScreen.routePath,
        pageBuilder: (context, pathParameters) => const CupertinoPage(
          child: AboutScreen(),
        ),
      ),
      GoRoute(
        name: CustomWebViewScreen.name,
        path: CustomWebViewScreen.routePath,
        pageBuilder: (context, pathParameters) {
          Map<String, dynamic>? args = pathParameters.uri.queryParameters;
          return CupertinoPage(
            child: CustomWebViewScreen(
              url: args[ScreenExtras.url],
            ),
          );
        },
      ),
      GoRoute(
        name: MediaAlbumScreen.name,
        path: MediaAlbumScreen.routePath,
        pageBuilder: (context, pathParameters) {
          Map<String, dynamic> query = pathParameters.uri.queryParameters;
          final args = pathParameters.extra as Map<String, dynamic>?;
          return CupertinoPage(
            child: MediaAlbumScreen(
              title: query[ScreenExtras.title],
              medias: args?[ScreenExtras.object],
            ),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: navigatorKey,
        name: AllMediaSliderScreen.name,
        path: AllMediaSliderScreen.routePath,
        pageBuilder: (context, pathParameters) {
          Map<String, dynamic> query = pathParameters.uri.queryParameters;
          Map<String, dynamic>? args = pathParameters.extra as Map<String, dynamic>?;
          return CupertinoPage(
            child: AllMediaSliderScreen(
              title: query[ScreenExtras.title] as String,
              medias: args?[ScreenExtras.object] as List<MediaModel>? ?? [],
              initialIndex: int.tryParse(query[ScreenExtras.initialIndex]) ?? 0,
              onPageChanged: args?[ScreenExtras.function] as Function(int)?,
            ),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: navigatorKey,
        name: ImageSliderScreen.name,
        path: ImageSliderScreen.routePath,
        pageBuilder: (context, pathParameters) {
          Map<String, dynamic>? args = pathParameters.extra as Map<String, dynamic>?;
          return CupertinoPage(
            child: ImageSliderScreen(
              initialIndex: args?[ScreenExtras.initialIndex],
              images: args?[ScreenExtras.images],
            ),
          );
        },
      ),
    ],
  );
}
