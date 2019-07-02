import 'package:flutter/material.dart';
import 'package:aula_flutter_calculo_imc/layoutFormat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: criarAndFormatarAppBar("Calculadora IMC"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120.0, color: Colors.blue),
              criarAndFormatarInputBox("Peso (Kg)"),
              criarAndFormatarInputBox("Altura (cm)"),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                    height: 50.0,
                    child: criarAndFormaterButton("Calcular")
                  ),
              ),
              Text("Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),)
            ],
          ),
        )
    );
  }
}