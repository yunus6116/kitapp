import 'package:auto_route/auto_route.dart';

extension AppRouterExtensions on StackRouter{
  bool stackContainsRoute(PageRouteInfo route){
    final indexOfRoute = stack.indexWhere((element) => element.name == route.routeName);
    return indexOfRoute != -1;
  }
}