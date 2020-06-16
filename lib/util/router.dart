import 'package:flutter/material.dart';
import 'package:notesapp/screen/home.dart';

class Router {
  static const String homeRoute = '/';

  static HomeScreen homeScreen = new HomeScreen();

  static MaterialPageRoute<dynamic> _buildRoute(String routeName, Widget child,
      {Function(BuildContext context) execute}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          if (execute != null) {
            execute(context);
          }
          return child;
        });
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _buildRoute(homeRoute, homeScreen);
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}