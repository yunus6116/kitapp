import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

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
        name: "MessagesTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: MessagesPage),
        ],
      ),
      AutoRoute(
        path: "explore-tab",
        name: "NotificationsTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: NotificationsPage),
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
