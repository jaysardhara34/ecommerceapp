import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override

  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      return Navigator.pushReplacementNamed(context, 'home');
    });

    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/image/logo.png')],
            ),
          ),
        ));
  }
}
