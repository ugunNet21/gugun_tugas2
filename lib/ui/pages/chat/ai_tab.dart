import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AiTab extends StatefulWidget {
  @override
  _AiTabState createState() => _AiTabState();
}

class _AiTabState extends State<AiTab> {
  late IO.Socket socket;
  TextEditingController messageController = TextEditingController();
  List<String> chatHistory = [];

  @override
  void initState() {
    super.initState();
    // Connect to the chat server
    socket = IO.io('http://gugun-aicom', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    // Listen for chat messages from the server
    socket.on('chat message', (data) {
      setState(() {
        chatHistory.add(data);
      });
    });
  }

  @override
  void dispose() {
    // Disconnect from the chat server
    socket.disconnect();
    super.dispose();
  }

  void sendMessage() {
    String message = messageController.text;
    if (message.isNotEmpty) {
      socket.emit('chat message', message);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatHistory[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
