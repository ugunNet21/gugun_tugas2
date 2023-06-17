import 'package:flutter/material.dart';

class DetailMateriPelajaran extends StatelessWidget {
  final String subject;

  const DetailMateriPelajaran({required this.subject});

  @override
  Widget build(BuildContext context) {
    List<Question> mathQuestions = [
      Question(
        question: 'Berapakah hasil dari 2 + 3?',
        options: ['4', '5', '6', '7'],
        answerIndex: 1,
      ),
      Question(
        question: 'Hitunglah 5 x 8 = ?',
        options: ['20', '30', '40', '45'],
        answerIndex: 2,
      ),
      // Tambahkan soal matematika lainnya di sini
    ];

    List<Question> indonesianQuestions = [
      Question(
        question: 'Siapakah penulis buku "Laskar Pelangi"?',
        options: ['Andrea Hirata', 'Tere Liye', 'Dewi Lestari', 'Ahmad Fuadi'],
        answerIndex: 0,
      ),
      Question(
        question: 'Apa sinonim dari kata "bagus"?',
        options: ['Jelek', 'Cantik', 'Baik', 'Rusak'],
        answerIndex: 2,
      ),
      // Tambahkan soal Bahasa Indonesia lainnya di sini
    ];

    List<Question> englishQuestions = [
      Question(
        question: 'What is the opposite of "hot"?',
        options: ['Cold', 'Wet', 'Dry', 'Big'],
        answerIndex: 0,
      ),
      Question(
        question: 'Choose the correct past tense of "go".',
        options: ['Went', 'Gone', 'Goed', 'Going'],
        answerIndex: 0,
      ),
      // Tambahkan soal Bahasa Inggris lainnya di sini
    ];

    List<Question> islamicHistoryQuestions = [
      Question(
        question: 'Siapakah tokoh utama dalam sejarah Islam?',
        options: ['Nabi Muhammad SAW', 'Ali bin Abi Thalib', 'Umar bin Khattab', 'Abu Bakar Ash-Shiddiq'],
        answerIndex: 0,
      ),
      Question(
        question: 'Dimanakah berdirinya Kerajaan Islam pertama?',
        options: ['Madinah', 'Mekah', 'Kairo', 'Damaskus'],
        answerIndex: 0,
      ),
      // Tambahkan soal sejarah Islam lainnya di sini
    ];

    List<Question> tajweedQuestions = [
      Question(
        question: 'Berapa jumlah huruf dalam huruf hijaiyah?',
        options: ['26', '27', '28', '29'],
        answerIndex: 1,
      ),
      Question(
        question: 'Berapa jumlah harakat dalam ilmu tajwid?',
        options: ['5', '6', '7', '8'],
        answerIndex: 2,
      ),
      // Tambahkan soal ilmu tajwid lainnya di sini
    ];

    // Tambahkan latihan soal untuk mata pelajaran lainnya seperti IPA, IPS, TIK, Informatika, PAI, Bahasa Arab, Bahasa Sunda, dll.

    List<Question> questions = [];

    switch (subject) {
      case 'Matematika':
        questions = mathQuestions;
        break;
      case 'Bahasa Indonesia':
        questions = indonesianQuestions;
        break;
      case 'Bahasa Inggris':
        questions = englishQuestions;
        break;
      case 'Sejarah Islam':
        questions = islamicHistoryQuestions;
        break;
      case 'Ilmu Tajwid':
        questions = tajweedQuestions;
        break;
      // Tambahkan kasus untuk mata pelajaran lainnya di sini
      default:
        // Tampilkan pesan kesalahan jika mata pelajaran tidak ditemukan
        return Scaffold(
          appBar: AppBar(
            title: Text('Detail Materi Pelajaran'),
          ),
          body: Center(
            child: Text('Mata pelajaran tidak ditemukan.'),
          ),
        );
    }

    int score = 0; // Variabel untuk menyimpan skor

    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Soal $subject'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          Question question = questions[index];
          return Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Pilih Jawaban'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...question.options.asMap().entries.map(
                            (entry) {
                              int optionIndex = entry.key;
                              String option = entry.value;
                              return RadioListTile(
                                title: Text(option),
                                value: optionIndex,
                                groupValue: question.selectedAnswer,
                                onChanged: (value) {
                                  question.selectedAnswer = value as int?;
                                  Navigator.pop(context);
                                  // Menghitung skor
                                  int correctAnswers = 0;
                                  for (Question question in questions) {
                                    if (question.selectedAnswer != null &&
                                        question.selectedAnswer == question.answerIndex) {
                                      correctAnswers++;
                                    }
                                  }
                                  score = (correctAnswers / questions.length * 100).round();
                                  // Menampilkan dialog hasil latihan soal
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Hasil Latihan Soal'),
                                        content: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Jawaban Benar: $correctAnswers / ${questions.length}',
                                            ),
                                            SizedBox(height: 8),
                                            Text('Skor: $score%'),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Tutup'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pertanyaan ${index + 1}:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      question.question,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: question.options.length,
                      itemBuilder: (context, optionIndex) {
                        String option = question.options[optionIndex];
                        return RadioListTile(
                          title: Text(option),
                          value: optionIndex,
                          groupValue: question.selectedAnswer,
                          onChanged: (value) {
                            question.selectedAnswer = value as int?;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int correctAnswers = 0;
          for (Question question in questions) {
            if (question.selectedAnswer != null &&
                question.selectedAnswer == question.answerIndex) {
              correctAnswers++;
            }
          }

          score = (correctAnswers / questions.length * 100).round(); // Hitung skor

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Hasil Latihan Soal'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Jawaban Benar: $correctAnswers / ${questions.length}'),
                    SizedBox(height: 8),
                    Text('Skor: $score%'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tutup'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int answerIndex;
  int? selectedAnswer;

  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
    this.selectedAnswer,
  });
}
