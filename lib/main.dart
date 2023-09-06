import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', 
    theme: ThemeData.light(), 
    darkTheme: ThemeData.dark(), 
    themeMode: ThemeMode.system, 
    getPages: [
      GetPage(name: '/', page: () => SplashScreen()), // Route for SplashScreen
      GetPage(name: '/login', page: () => LoginScreen()), // Route for LoginScreen
      GetPage(name: '/home', page: () => HomeScreen()), // Route for HomeScreen
    ],
  ));
}
