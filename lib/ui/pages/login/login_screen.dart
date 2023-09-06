import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginScreen({super.key});

  Future<UserCredential> _signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();

      final UserCredential userCredential =
          await _auth.signInWithPopup(googleProvider);

      Get.off(() => HomeScreen());

      return userCredential;
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to sign in with Google');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                _signInWithGoogle();
              },
              icon: const Icon(Icons.login),
              label: const Text('Login dengan Google'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Login using Apple ID
                // Implement Apple ID login logic here
                // After successful login, navigate to HomeScreen
                Get.off(() => HomeScreen());
              },
              icon: const Icon(Icons.login),
              label: const Text('Login dengan Apple ID'),
            ),
          ],
        ),
      ),
    );
  }
}
