import 'package:chatApp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController=TextEditingController();
  final List<ChatMessage> _message=<ChatMessage> [];

 
  void _handleSubmited(String text){
    _textController.clear();
    ChatMessage message=ChatMessage(
      text: text,
    );
    setState(() {
      _message.insert(0,message);
    });
  }


  Widget _textComposerWidget(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue
      ),
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: <Widget>[
        Flexible(
             child: TextField(   
          controller: _textController,
          onSubmitted: _handleSubmited,     
          decoration: InputDecoration.collapsed(
            hintText: "Send a message",
            
            ),
        ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            icon: Icon(Icons.send),
            onPressed: ()=> _handleSubmited(_textController.text),
            
          ),
        )
      ],),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_,int index)=>_message[index],
            itemCount: _message.length,
          ),
        ),
        Divider(height: 1.0,),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,            
          ),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}