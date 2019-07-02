import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoCrtl = new TextEditingController();
  TextEditingController alturaCrtl = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _informe = "Digite seu peso e sua altura";

//Resetar texts
  void _textReset() {
    pesoCrtl.text = "";
    alturaCrtl.text = "";
    setState(() {
      _informe = "Digite seu peso e sua altura";
      _formKey = new GlobalKey<FormState>(); 
    });
  }

//Calculo IMC
  void _calcularIMC() {
    setState(() {
      double weight = double.parse(pesoCrtl.text);
      double height = double.parse(alturaCrtl.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6)
        _informe = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      else if (imc >= 18.6 && imc < 24.9)
        _informe = "Peso ideal (${imc.toStringAsPrecision(3)})";
      else if (imc >= 24.9 && imc < 29.9)
        _informe = "Levemente acima do Peso (${imc.toStringAsPrecision(3)})";
      else if (imc >= 29.9 && imc < 34.9)
        _informe = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      else if (imc >= 34.9 && imc < 39.9)
        _informe = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
      else if (imc >= 40)
        _informe = "Obesidade grau III (${imc.toStringAsPrecision(3)})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _textReset,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person, size: 120.0, color: Colors.blue),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.blue)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  controller: pesoCrtl,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira o peso";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.blue)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  controller: alturaCrtl,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira a altura";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calcularIMC();
                          }
                        }),
                  ),
                ),
                Text(_informe,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ));
  }
}
