import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulasi penundaan 2 detik sebelum pindah ke halaman beranda
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => HomeScreen());
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    Icon(
                      Icons.school,
                      size: 64,
                      color: Colors.blue,
                    ),
                    Text(
                      'Ihsan Edu',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
