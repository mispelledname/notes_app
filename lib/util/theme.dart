import 'package:flutter/material.dart';
import 'colour.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appLightTheme = _buildLightTheme();
final ThemeData appDarkTheme = _buildDarkTheme();

TextTheme _buildTextTheme() {
  return TextTheme(
    
  ); 
}

Color primaryColor = Colors.indigo;
Color primaryColorDark = Colors.indigo[400];

// so that there are no lines above/below expansiontile
Color dividerColor = Colors.transparent;

// for timings not available box
Color errorColor = Colors.red;

// for better back transition
PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    accentColor: primaryColor,
    scaffoldBackgroundColor: AppColor.lightBgColor,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    toggleableActiveColor: primaryColor,
    dividerColor: dividerColor,
    errorColor: errorColor,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(),
    pageTransitionsTheme: _pageTransitionsTheme,
  );
}

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    accentColor: primaryColorDark,
    scaffoldBackgroundColor: AppColor.darkBgColor,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    toggleableActiveColor: primaryColor,
    dividerColor: dividerColor,
    errorColor: errorColor,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(),
    pageTransitionsTheme: _pageTransitionsTheme,
  );
}