import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'splash_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(name: '/home', page: () => HomeScreen()),
    ],
  ));
}
