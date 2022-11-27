import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:kitapp/view/pages/onboarding_page/onboarding_page.dart';

import '../../view/pages/main_page/explore_page/explore_page.dart';
import '../../view/pages/main_page/home_page/home_page.dart';
import '../../view/pages/main_page/main_page.dart';
import '../../view/pages/main_page/my_profile_page/my_profile_page.dart';
import '../../view/pages/main_page/search_page/search_page.dart';
import '../../view/pages/splash_page/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      initial: true,
      path: "/",
    ),
    AutoRoute(page: OnboardingPage),
    AutoRoute(page: MainPage, children: [
      AutoRoute(
        path: "home-tab",
        name: "HomeTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: HomePage),
        ],
      ),
      AutoRoute(
        path: "search-tab",
        name: "SearchTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: SearchPage),
        ],
      ),
      AutoRoute(
        path: "explore-tab",
        name: "ExploreTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: ExplorePage),
        ],
      ),
      AutoRoute(
        path: "my-profile-tab",
        name: "MyProfileTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: MyProfilePage),
        ],
      )
    ]),
  ],
)
class $AppRouter {}
