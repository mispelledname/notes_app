import 'package:flutter/material.dart';
import 'util/router.dart';
import 'util/theme.dart';
import 'package:notesapp/util/locator.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/model/CRUDModel.dart';

/// Runs the app.
/// 
/// Sets up the service locator then runs the main application Widget
void main() {
  setupLocator();
  runApp(NotesApp());
}

/// Application 
class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  NavigatorObserverController observer = NavigatorObserverController();
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
      ],
      child: new MaterialApp(
        title: 'NotesApp',
        theme: appDarkTheme,
        initialRoute: Router.homeRoute,
        navigatorObservers: <NavigatorObserver>[observer],
        onGenerateRoute: Router.generateRoute,
      )
    );
  }
}

/// Navigator Observer 
/// 
/// Check navigation between screens. 
class NavigatorObserverController extends NavigatorObserver {
  
  /// Observe route push 
  @override
  void didPush(Route route, Route previousRoute) {
    print("Current route:  ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  /// Observe route pop
  @override
  void didPop(Route route, Route previousRoute) {
    print("Current route:  ${previousRoute?.settings?.name}");
    super.didPop(route, previousRoute);
  }
}