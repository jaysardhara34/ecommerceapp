import 'dart:async';

import 'package:ecommerceapp/screens/products/utils/sharedPrefrence.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override

  Widget build(BuildContext context) {
    checkLogin();
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
  void checkLogin() async {
    bool? status = await getisloginSHP();
    if (status == true) {
      Timer(Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, 'home'),);
    } else {
      Timer(Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, 'login'),);
    }
  }
}
