import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/pages/Home/home_view.dart';

class SplashView extends StatefulWidget {

  static const String routeName ="Splash";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(
      seconds: 3,
    ),
            () {
      Navigator.pushNamedAndRemoveUntil(context,
          HomeView.
          routeName
          , (route) => false);
            }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
