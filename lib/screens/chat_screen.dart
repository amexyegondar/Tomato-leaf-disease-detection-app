import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "text": _controller.text});
      _messages.add({"sender": "bot", "text": _generateResponse(_controller.text)});
      _controller.clear();
    });
  }

  String _generateResponse(String userMessage) {
    
    if (userMessage.toLowerCase().contains('እፈልጋለሁ')) {
      return "እሚፈልጉትን በአጭር ጽሁፍ ያስቀምጡልን። በአጭር ግዜ ውስጥ እንመልስሎታለን።";
    }
    else if(userMessage.toLowerCase().contains('need')){
      return "Give us some information.";
    }
    else{
      return 'እኔ እመሰጠው አገልግሎት የቲማቲም በሽታ ጋር በተያያዘ ከባለሞያዎች ጋር ማገናኘት ነው። እርዳታ ከፈለጉ "እርዳታ" ብለው እጻፉ።';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ግንኙነቶች', style: GoogleFonts.poppins()),
          backgroundColor: Colors.white,
        ),
        
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isMe = _messages[index]['sender'] == 'user';
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isMe
                            ? Colors.green
                            : Color.fromRGBO(38, 54, 69, 1),
                        borderRadius: isMe
                            ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                      ),
                      child: Center(
                        child: Text(
                          _messages[index]['text']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.965),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'መልእክትኦትን ያስገቡ',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.blueGrey,
                          fontSize: 11,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.green),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
