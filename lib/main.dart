import 'package:flutter/material.dart';
import 'package:news/core/Theme/theme.dart';
import 'package:news/pages/Home/home_view.dart';
import 'package:news/pages/Settings/settings_view.dart';
import 'package:news/pages/Splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.lightTheme ,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName:(context)=> const SplashView(),
        HomeView.routeName:(context)=>  HomeView(),
        SettingsView.routeName:(context)=> const SettingsView(),
      },

    );
  }
}
