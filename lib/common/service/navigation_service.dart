import 'package:flutter/material.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic routeTo(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }

  dynamic goBackWithResult(dynamic result) {
    return navigatorKey.currentState?.pop(result);
  }
  dynamic replaceRoute(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  dynamic replaceRouteWithResult(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  dynamic routeToAndRemoveUntil(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  }

  dynamic routeToAndRemoveUntilWithResult(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  }
}