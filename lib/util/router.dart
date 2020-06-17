import 'package:flutter/material.dart';
import 'package:notesapp/screen/home.dart';

/// Router 
/// 
/// For navigation within the app. 
class Router {
  // route constants 
  static const String homeRoute = '/';

  // route screens 
  static HomeScreen homeScreen = new HomeScreen();

  /// build route based on route name and route screen 
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

  /// generate the route specified 
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _buildRoute(homeRoute, homeScreen);
        break;

      // unable to find route 
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}