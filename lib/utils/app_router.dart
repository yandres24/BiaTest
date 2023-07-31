import 'package:biatest/router/navigation_controller.dart';
import 'package:biatest/router/routes.dart';
import 'package:flutter/cupertino.dart';

extension AppRouter<T extends StatefulWidget> on State<T> {
  void transitionToHomePage() {
    NavigationController.push(Routes.home.routeName, replace: true);
  }

  void pop() {
    Navigator.pop(context);
  }
}
