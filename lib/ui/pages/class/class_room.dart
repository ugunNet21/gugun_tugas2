import 'package:flutter/material.dart';

class Classroom {
  final String name;
  final String grade;

  Classroom({
    required this.name,
    required this.grade,
  });
}

class ClassroomListWidget extends StatefulWidget {
  const ClassroomListWidget({super.key});

  @override
  _ClassroomListWidgetState createState() => _ClassroomListWidgetState();
}

class _ClassroomListWidgetState extends State<ClassroomListWidget> {
  List<Classroom> classroomList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the classroom list
    classroomList = [
      Classroom(
        name: 'Class 7A',
        grade: '7th Grade',
      ),
      Classroom(
        name: 'Class 8B',
        grade: '8th Grade',
      ),
      Classroom(
        name: 'Class 9C',
        grade: '9th Grade',
      ),
      // Add more classrooms as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom List'),
      ),
      body: ListView.builder(
        itemCount: classroomList.length,
        itemBuilder: (context, index) {
          final classroom = classroomList[index];
          return ListTile(
            title: Text(classroom.name),
            subtitle: Text('Grade: ${classroom.grade}'),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classroom List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClassroomListWidget(),
    );
  }
}
