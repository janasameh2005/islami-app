import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/onboarding_screen.dart';
import 'home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner:false,
      routes: {HomeScreen.routeName:(_)=>HomeScreen(),
        OnboardingScreen.routeName:(_)=>OnboardingScreen()},
      initialRoute: OnboardingScreen.routeName,
      theme:AppTheme.lightTheme,
      darkTheme:AppTheme.darkTheme ,
      themeMode:ThemeMode.dark,
    );
  }
}