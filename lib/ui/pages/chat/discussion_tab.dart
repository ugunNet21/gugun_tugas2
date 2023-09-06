import 'package:flutter/material.dart';

class DiscussionTab extends StatelessWidget {
  final List<String> conversation = [
    'Percakapan 1',
    'Percakapan 2',
    'Percakapan 3',
    'Percakapan 4',
    'Percakapan 5',
  ];

  DiscussionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diskusi Soal',
        ),
      ),
      body: ListView.builder(
        itemCount: conversation.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(conversation[index]),
              onTap: () {
                // Aksi saat percakapan dipilih
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'Percakapan',
                      ),
                      content: Text(conversation[index]),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Tutup',
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
