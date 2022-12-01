import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import '../../view/pages/onboarding_page/onboarding_page.dart';

import '../../view/pages/main_page/explore_page/explore_page.dart';
import '../../view/pages/main_page/home_page/home_page.dart';
import '../../view/pages/main_page/main_page.dart';
import '../../view/pages/main_page/my_profile_page/my_profile_page.dart';
import '../../view/pages/main_page/search_page/search_page.dart';
import '../../view/pages/sign_in_page/sign_in_page.dart';
import '../../view/pages/sign_up_page/sign_up_page.dart';
import '../../view/pages/splash_page/splash_page.dart';
import '../../view/pages/welcome_page/welcome_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
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
    AutoRoute(page: OnboardingPage),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: SignUpPage),
  ],
)
class $AppRouter {}
