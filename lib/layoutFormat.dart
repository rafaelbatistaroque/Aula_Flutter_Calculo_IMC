import 'package:flutter/material.dart';

//Criar e alterar propriedads da AppBar
AppBar criarAndFormatarAppBar(String _title){
  return AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.send),
              onPressed: () {},
            )
          ]
        );
}
//Criar e alterar propriedades das InputBox
TextField criarAndFormatarInputBox(String _label){
  return TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "$_label",
            labelStyle: TextStyle(color: Colors.blue)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 16.0)
        );
}
//Criar e alterar propriedades do button
RaisedButton criarAndFormaterButton(String _textButton){
  return RaisedButton(
    onPressed: (){},
    child: Text("$_textButton",
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    color: Colors.blue
  );
}
