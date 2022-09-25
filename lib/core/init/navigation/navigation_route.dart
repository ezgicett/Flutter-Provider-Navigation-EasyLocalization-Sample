import 'package:dice_app/core/pages/dice_page.dart';
import 'package:dice_app/core/pages/fav_page.dart';
import 'package:flutter/material.dart';

import '../../constants/navigation/navigation_constants.dart';
import '../../pages/shopping_list.dart';
import '../../pages/splash_page.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(SplashPage());

      case NavigationConstants.FAV_PAGE:
        return normalNavigate(FavPage());

      case NavigationConstants.DICE_PAGE:
        return normalNavigate(DicePage());

      // case NavigationConstants.SHOPPING_PAGE:
      //   return normalNavigate(TestsView(), NavigationConstants.TEST_VIEW);

      default:
        return MaterialPageRoute(
          builder: (context) => ShoppingList(),
        );
    }
  }

  MaterialPageRoute<Widget> normalNavigate(Widget widget) =>
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => widget,
      );
}
