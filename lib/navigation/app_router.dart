import 'package:flutter/material.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/models/models.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter(
      {required this.appStateManager,
      required this.groceryManager,
      required this.profileManager})
      : navigatorKey = GlobalKey<NavigatorState>() {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [],
      onPopPage: _handlePopPage,
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
