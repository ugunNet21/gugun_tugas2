import 'package:biodata_ugun/ui/pages/class/class_room.dart';
import 'package:biodata_ugun/ui/pages/quiz/quiz.dart';
import 'package:biodata_ugun/ui/pages/quiz/score.dart';
import 'package:biodata_ugun/ui/pages/student/student_list.dart';
import 'package:biodata_ugun/ui/pages/teachers/teacher_list.dart';
import 'package:flutter/material.dart';

import '../ui/pages/books/book_list_tab.dart';
import '../ui/pages/mapel/detail_mata_pelajaran.dart';
import 'profile_tab.dart';


class HomeTab extends StatelessWidget {
  final List<String> subjects = [
    'Matematika',
    'Bahasa Indonesia',
    'Bahasa Inggris',
    'IPA',
    'IPS',
    'TIK',
    'Informatika',
    'PAI',
    'Bahasa Arab',
    'Bahasa Sunda',
    'Sejarah',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text('Dashboard'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification icon pressed
              },
            ),
            IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://png.pngtree.com/png-clipart/20221025/ourmid/pngtree-anak-smp-berdiri-memasukkan-2-tangan-ke-saku-png-image_6386843.png', // Ganti dengan URL gambar profil yang diinginkan
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileTab(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Hi Ihsan, Selamat Datang',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookListTab(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.library_books, size: 40),
                                  Text('Daftar Buku'),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TeacherListWidget(),
                                  ),
                                );
                              },
                              child: Column(
                              children: [
                                Icon(Icons.people, size: 40),
                                Text('Daftar Guru'),
                              ],
                            ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context)=> StudentListWidget() ));
                              },
                              child: Column(
                              children: [
                                Icon(Icons.school, size: 40),
                                Text('Daftar Siswa'),
                              ],
                            ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context)=> ClassroomListWidget() ),
                                    );
                              },
                              child: Column(
                              children: [
                                Icon(Icons.class_, size: 40),
                                Text('Class'),
                              ],
                            ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context) => QuizListWidget(),), );
                              },
                              child: Column(
                              children: [
                                Icon(Icons.quiz, size: 40),
                                Text('Quiz'),
                              ],
                            ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => ScoreListWidget(),),);
                              },
                              child: Column(
                              children: [
                                Icon(Icons.score, size: 40),
                                Text('Score'),
                              ],
                            ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(subjects[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMateriPelajaran(subject: subjects[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeTab(),
//     );
//   }
// }
