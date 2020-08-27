import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);

  Function(String) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();

  void _reset(){
    setState(() {
      _controller.clear();
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async{
              final Future<PickedFile> imgFfile = ImagePicker.platform.pickImage(source: ImageSource.camera);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(hintText: "Enviar Mensagem"),
              onChanged: (text){
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text){
                widget.sendMessage(text);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing ? (){
              widget.sendMessage(_controller.text);
              _reset();
            } : null,
          )
        ],
      ),
    );
  }
}
