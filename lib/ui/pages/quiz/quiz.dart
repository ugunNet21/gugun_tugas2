import 'package:flutter/material.dart';

class Quiz {
  final String name;
  final String topic;

  Quiz({
    required this.name,
    required this.topic,
  });
}

class QuizListWidget extends StatefulWidget {
  @override
  _QuizListWidgetState createState() => _QuizListWidgetState();
}

class _QuizListWidgetState extends State<QuizListWidget> {
  List<Quiz> quizList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the quiz list
    quizList = [
      Quiz(
        name: 'Quiz 1',
        topic: 'Mathematics',
      ),
      Quiz(
        name: 'Quiz 2',
        topic: 'Science',
      ),
      Quiz(
        name: 'Quiz 3',
        topic: 'History',
      ),
      // Add more quizzes as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz List'),
      ),
      body: ListView.builder(
        itemCount: quizList.length,
        itemBuilder: (context, index) {
          final quiz = quizList[index];
          return ListTile(
            title: Text(quiz.name),
            subtitle: Text('Topic: ${quiz.topic}'),
          );
        },
      ),
    );
  }
}

