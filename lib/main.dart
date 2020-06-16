import 'package:flutter/material.dart';
import 'util/router.dart';
import 'util/theme.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  NavigatorObserverController observer = NavigatorObserverController();
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NotesApp',
      theme: appDarkTheme,
      initialRoute: Router.homeRoute,
      navigatorObservers: <NavigatorObserver>[observer],
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class NavigatorObserverController extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    print("Current route:  ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print("Current route:  ${previousRoute?.settings?.name}");
    super.didPop(route, previousRoute);
  }
}