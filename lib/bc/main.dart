import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'menu_profile.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Dashboard(),
        '/menu_profile': (context) => MenuProfile(),
      },
    );
  }
}



