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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i11;
import 'package:kitapp/view/pages/main_page/explore_page/explore_page.dart'
    as _i8;
import 'package:kitapp/view/pages/main_page/home_page/home_page.dart' as _i6;
import 'package:kitapp/view/pages/main_page/main_page.dart' as _i2;
import 'package:kitapp/view/pages/main_page/my_profile_page/my_profile_page.dart'
    as _i9;
import 'package:kitapp/view/pages/main_page/search_page/search_page.dart'
    as _i7;
import 'package:kitapp/view/pages/onboarding_page/onboarding_page.dart' as _i3;
import 'package:kitapp/view/pages/sign_in_page/sign_in_page.dart' as _i4;
import 'package:kitapp/view/pages/splash_page/splash_page.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.SplashPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.MainPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    SearchTabRouter.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    ExploreTabRouter.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    MyProfileTabRouter.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SearchPage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.ExplorePage(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.MyProfilePage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i10.RouteConfig(
              HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              SearchTabRouter.name,
              path: 'search-tab',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  SearchRoute.name,
                  path: '',
                  parent: SearchTabRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              ExploreTabRouter.name,
              path: 'explore-tab',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  ExploreRoute.name,
                  path: '',
                  parent: ExploreTabRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              MyProfileTabRouter.name,
              path: 'my-profile-tab',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  MyProfileRoute.name,
                  path: '',
                  parent: MyProfileTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i10.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-page',
        ),
        _i10.RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeTabRouter extends _i10.PageRouteInfo<void> {
  const HomeTabRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home-tab',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SearchTabRouter extends _i10.PageRouteInfo<void> {
  const SearchTabRouter({List<_i10.PageRouteInfo>? children})
      : super(
          SearchTabRouter.name,
          path: 'search-tab',
          initialChildren: children,
        );

  static const String name = 'SearchTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ExploreTabRouter extends _i10.PageRouteInfo<void> {
  const ExploreTabRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ExploreTabRouter.name,
          path: 'explore-tab',
          initialChildren: children,
        );

  static const String name = 'ExploreTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class MyProfileTabRouter extends _i10.PageRouteInfo<void> {
  const MyProfileTabRouter({List<_i10.PageRouteInfo>? children})
      : super(
          MyProfileTabRouter.name,
          path: 'my-profile-tab',
          initialChildren: children,
        );

  static const String name = 'MyProfileTabRouter';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i8.ExplorePage]
class ExploreRoute extends _i10.PageRouteInfo<void> {
  const ExploreRoute()
      : super(
          ExploreRoute.name,
          path: '',
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i9.MyProfilePage]
class MyProfileRoute extends _i10.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '',
        );

  static const String name = 'MyProfileRoute';
}
