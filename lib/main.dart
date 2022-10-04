import 'package:ecommerceapp/screens/products/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/products/view/productHome.dart';
import 'package:ecommerceapp/screens/products/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          'home': (context) => HomeScreen(),
        },
      ),
    ),
  );
}
