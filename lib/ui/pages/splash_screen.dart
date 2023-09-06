import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulasi penundaan 3 detik sebelum pindah ke halaman beranda
    Future.delayed(Duration(seconds: 3), () {
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
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.black, // Ubah warna teks menjadi hitam
                          ),
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
