import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:kitapp/view/pages/book_detail_page/book_detail_page.dart';
import 'package:kitapp/view/pages/webview_page/webview_page.dart';

import '../../view/pages/forgot_password_page/forgot_password_page.dart';
import '../../view/pages/main_page/home_page/home_page.dart';
import '../../view/pages/main_page/main_page.dart';
import '../../view/pages/main_page/my_profile_page/my_profile_page.dart';
import '../../view/pages/main_page/search_page/search_page.dart';
import '../../view/pages/onboarding_page/onboarding_page.dart';
import '../../view/pages/sign_in_page/sign_in_page.dart';
import '../../view/pages/sign_up_page/sign_up_page.dart';
import '../../view/pages/splash_page/splash_page.dart';
import '../../view/pages/welcome_page/welcome_page.dart';
import '../../view/pages/main_page/book_grild_list_page/book_grid_list_page.dart';

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
    AutoRoute(page: ForgotPasswordPage),
    AutoRoute(page: BookGridListPage),
    AutoRoute(page: BookDetailPage),
    AutoRoute(page: WebViewPage),
  ],
)
class $AppRouter {}
