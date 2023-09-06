import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../chat/ai_tab.dart';
import 'home_controller.dart';
import 'home_tab.dart';
import '../chat/discussion_tab.dart';
import '../profile/profile_tab.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    HomeTab(),
    AiTab(),
    DiscussionTab(),
    ProfileTab(),
  ];

  HomeScreen({super.key});

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
          items: const [
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
