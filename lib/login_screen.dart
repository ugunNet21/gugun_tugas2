import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Login menggunakan Google
                // Implementasikan logika login dengan Google di sini
                // Setelah berhasil login, pindah ke halaman HomeScreen
                Get.off(() => HomeScreen());
              },
              child: Text('Login dengan Google'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Login menggunakan Apple ID
                // Implementasikan logika login dengan Apple ID di sini
                // Setelah berhasil login, pindah ke halaman HomeScreen
                Get.off(() => HomeScreen());
              },
              child: Text('Login dengan Apple ID'),
            ),
          ],
        ),
      ),
    );
  }
}
