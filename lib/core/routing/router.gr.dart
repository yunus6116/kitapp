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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:auto_route/empty_router_widgets.dart' as _i9;
import 'package:flutter/material.dart' as _i14;
import 'package:kitapp/view/pages/main_page/favourites_page/favourites_page.dart'
    as _i8;
import 'package:kitapp/view/pages/forgot_password_page/forgot_password_page.dart'
    as _i7;
import 'package:kitapp/view/pages/main_page/home_page/home_page.dart' as _i10;
import 'package:kitapp/view/pages/main_page/main_page.dart' as _i2;
import 'package:kitapp/view/pages/main_page/my_profile_page/my_profile_page.dart'
    as _i12;
import 'package:kitapp/view/pages/main_page/search_page/search_page.dart'
    as _i11;
import 'package:kitapp/view/pages/onboarding_page/onboarding_page.dart' as _i3;
import 'package:kitapp/view/pages/sign_in_page/sign_in_page.dart' as _i5;
import 'package:kitapp/view/pages/sign_up_page/sign_up_page.dart' as _i6;
import 'package:kitapp/view/pages/splash_page/splash_page.dart' as _i1;
import 'package:kitapp/view/pages/welcome_page/welcome_page.dart' as _i4;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.SplashPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.MainPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.WelcomePage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.SignInPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.ForgotPasswordPage(key: args.key),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.FavouritesPage(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    SearchTabRouter.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    MyProfileTabRouter.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.HomePage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.SearchPage(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyProfilePage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i13.RouteConfig(
              HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              children: [
                _i13.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i13.RouteConfig(
              SearchTabRouter.name,
              path: 'search-tab',
              parent: MainRoute.name,
              children: [
                _i13.RouteConfig(
                  SearchRoute.name,
                  path: '',
                  parent: SearchTabRouter.name,
                )
              ],
            ),
            _i13.RouteConfig(
              MyProfileTabRouter.name,
              path: 'my-profile-tab',
              parent: MainRoute.name,
              children: [
                _i13.RouteConfig(
                  MyProfileRoute.name,
                  path: '',
                  parent: MyProfileTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i13.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-page',
        ),
        _i13.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome-page',
        ),
        _i13.RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        _i13.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-page',
        ),
        _i13.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
        _i13.RouteConfig(
          FavouritesRoute.name,
          path: '/favourites-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.WelcomePage]
class WelcomeRoute extends _i13.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i14.Key? key})
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
          args: SignInRouteArgs(key: key),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i13.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({_i14.Key? key})
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
          args: ForgotPasswordRouteArgs(key: key),
        );

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.FavouritesPage]
class FavouritesRoute extends _i13.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: '/favourites-page',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class HomeTabRouter extends _i13.PageRouteInfo<void> {
  const HomeTabRouter({List<_i13.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home-tab',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SearchTabRouter extends _i13.PageRouteInfo<void> {
  const SearchTabRouter({List<_i13.PageRouteInfo>? children})
      : super(
          SearchTabRouter.name,
          path: 'search-tab',
          initialChildren: children,
        );

  static const String name = 'SearchTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class MyProfileTabRouter extends _i13.PageRouteInfo<void> {
  const MyProfileTabRouter({List<_i13.PageRouteInfo>? children})
      : super(
          MyProfileTabRouter.name,
          path: 'my-profile-tab',
          initialChildren: children,
        );

  static const String name = 'MyProfileTabRouter';
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.SearchPage]
class SearchRoute extends _i13.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i12.MyProfilePage]
class MyProfileRoute extends _i13.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '',
        );

  static const String name = 'MyProfileRoute';
}
