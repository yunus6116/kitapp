// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i10;
import 'package:kitapp/view/pages/main_page/explore_page/explore_page.dart'
    as _i7;
import 'package:kitapp/view/pages/main_page/home_page/home_page.dart' as _i5;
import 'package:kitapp/view/pages/main_page/main_page.dart' as _i3;
import 'package:kitapp/view/pages/main_page/my_profile_page/my_profile_page.dart'
    as _i8;
import 'package:kitapp/view/pages/main_page/search_page/search_page.dart'
    as _i6;
import 'package:kitapp/view/pages/onboarding_page/onboarding_page.dart' as _i2;
import 'package:kitapp/view/pages/splash_page/splash_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.MainPage(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    SearchTabRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    ExploreTabRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    MyProfileTabRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SearchPage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.ExplorePage(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MyProfilePage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-page',
        ),
        _i9.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i9.RouteConfig(
              HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              children: [
                _i9.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i9.RouteConfig(
              SearchTabRouter.name,
              path: 'search-tab',
              parent: MainRoute.name,
              children: [
                _i9.RouteConfig(
                  SearchRoute.name,
                  path: '',
                  parent: SearchTabRouter.name,
                )
              ],
            ),
            _i9.RouteConfig(
              ExploreTabRouter.name,
              path: 'explore-tab',
              parent: MainRoute.name,
              children: [
                _i9.RouteConfig(
                  ExploreRoute.name,
                  path: '',
                  parent: ExploreTabRouter.name,
                )
              ],
            ),
            _i9.RouteConfig(
              MyProfileTabRouter.name,
              path: 'my-profile-tab',
              parent: MainRoute.name,
              children: [
                _i9.RouteConfig(
                  MyProfileRoute.name,
                  path: '',
                  parent: MyProfileTabRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeTabRouter extends _i9.PageRouteInfo<void> {
  const HomeTabRouter({List<_i9.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home-tab',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SearchTabRouter extends _i9.PageRouteInfo<void> {
  const SearchTabRouter({List<_i9.PageRouteInfo>? children})
      : super(
          SearchTabRouter.name,
          path: 'search-tab',
          initialChildren: children,
        );

  static const String name = 'SearchTabRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ExploreTabRouter extends _i9.PageRouteInfo<void> {
  const ExploreTabRouter({List<_i9.PageRouteInfo>? children})
      : super(
          ExploreTabRouter.name,
          path: 'explore-tab',
          initialChildren: children,
        );

  static const String name = 'ExploreTabRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class MyProfileTabRouter extends _i9.PageRouteInfo<void> {
  const MyProfileTabRouter({List<_i9.PageRouteInfo>? children})
      : super(
          MyProfileTabRouter.name,
          path: 'my-profile-tab',
          initialChildren: children,
        );

  static const String name = 'MyProfileTabRouter';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.ExplorePage]
class ExploreRoute extends _i9.PageRouteInfo<void> {
  const ExploreRoute()
      : super(
          ExploreRoute.name,
          path: '',
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i8.MyProfilePage]
class MyProfileRoute extends _i9.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '',
        );

  static const String name = 'MyProfileRoute';
}
