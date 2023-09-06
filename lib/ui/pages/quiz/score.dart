import 'package:flutter/material.dart';

class Score {
  final String subject;
  final double value;

  Score({
    required this.subject,
    required this.value,
  });
}

class ScoreListWidget extends StatefulWidget {
  const ScoreListWidget({super.key});

  @override
  _ScoreListWidgetState createState() => _ScoreListWidgetState();
}

class _ScoreListWidgetState extends State<ScoreListWidget> {
  List<Score> scoreList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the score list
    scoreList = [
      Score(
        subject: 'Mathematics',
        value: 85.0,
      ),
      Score(
        subject: 'Science',
        value: 92.5,
      ),
      Score(
        subject: 'History',
        value: 78.0,
      ),
      // Add more scores as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score List'),
      ),
      body: ListView.builder(
        itemCount: scoreList.length,
        itemBuilder: (context, index) {
          final score = scoreList[index];
          return ListTile(
            title: Text(score.subject),
            subtitle: Text('Score: ${score.value}'),
          );
        },
      ),
    );
  }
}

