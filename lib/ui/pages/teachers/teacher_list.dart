import 'package:flutter/material.dart';

class Teacher {
  final String name;
  final String degree;
  final String subject;
  final int age;

  Teacher({
    required this.name,
    required this.degree,
    required this.subject,
    required this.age,
  });
}

class TeacherListWidget extends StatefulWidget {
  @override
  _TeacherListWidgetState createState() => _TeacherListWidgetState();
}

class _TeacherListWidgetState extends State<TeacherListWidget> {
  List<Teacher> teacherList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the teacher list
    teacherList = [
      Teacher(
        name: 'Ugun1',
        degree: 'Master of Science',
        subject: 'Mathematics',
        age: 35,
      ),
      Teacher(
        name: 'Ugun2',
        degree: 'Doctorate in Education',
        subject: 'English Literature',
        age: 42,
      ),
      Teacher(
        name: 'Ugun3',
        degree: 'Bachelor of Arts',
        subject: 'History',
        age: 39,
      ),
      // Add more teachers as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher List'),
      ),
      body: ListView.builder(
        itemCount: teacherList.length,
        itemBuilder: (context, index) {
          final teacher = teacherList[index];
          return ListTile(
            title: Text(teacher.name),
            subtitle: Text('${teacher.subject} - ${teacher.degree}'),
            trailing: Text('${teacher.age} years old'),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeacherListWidget(),
    );
  }
}
