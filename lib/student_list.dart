import 'package:flutter/material.dart';

class Student {
  final String name;
  final String grade;
  final int age;

  Student({
    required this.name,
    required this.grade,
    required this.age,
  });
}

class StudentListWidget extends StatefulWidget {
  @override
  _StudentListWidgetState createState() => _StudentListWidgetState();
}

class _StudentListWidgetState extends State<StudentListWidget> {
  List<Student> studentList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the student list
    studentList = [
      Student(
        name: 'Ugun1',
        grade: '9th Grade',
        age: 14,
      ),
      Student(
        name: 'Ugun2',
        grade: '10th Grade',
        age: 15,
      ),
      Student(
        name: 'ugun3',
        grade: '11th Grade',
        age: 16,
      ),
      // Add more students as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final student = studentList[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('Grade: ${student.grade}'),
            trailing: Text('${student.age} years old'),
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
      title: 'Student List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentListWidget(),
    );
  }
}
