import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ai_tab.dart';
import 'home_controller.dart';
import 'home_tab.dart';
import 'discussion_tab.dart';
import 'profile_tab.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    HomeTab(),
    AiTab(),
    DiscussionTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Colors.blue, // Warna ikon dan label yang dipilih
          unselectedItemColor:
              Colors.grey, // Warna ikon dan label yang tidak dipilih
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb),
              label: 'AI',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              label: 'Diskusi Soal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
