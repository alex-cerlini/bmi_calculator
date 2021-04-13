import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pesoEntrada = TextEditingController();
  var alturaEntrada = TextEditingController();
  var peso = 0.0;
  var altura = 0.0;
  var imc = 0.0;
  var resultado = "Por favor, entre com seu peso e altura";
  var classificacao = "Aguardando dados";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  pesoEntrada.text = "";
                  alturaEntrada.text = "";
                  peso = 0.0;
                  altura = 0.0;
                  imc = 0.0;
                  resultado = "Por favor, entre com seu peso e altura";
                  classificacao = "Aguardando dados";
                });
              }),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Insira seu peso (kg)",
                  hintText: 'Insira seu peso (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: pesoEntrada,
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  // border: UnderlineInputBorder(),
                  labelText: "Insira sua altura (cm)",
                  hintText: 'Insira sua altura (cm)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: alturaEntrada,
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Text(resultado),
            Text("Classificação:  $classificacao"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (pesoEntrada.text.isEmpty || alturaEntrada.text.isEmpty) {
              return;
            }
            peso = double.tryParse(pesoEntrada.text);
            altura = double.tryParse(alturaEntrada.text);
            imc = (peso / (altura * altura)) * 10000;

            if (imc <= 0) {
              resultado = "Por favor, entre com seu peso e altura";
            } else if (imc > 0 && imc <= 18.5) {
              resultado = "Seu IMC é ${imc.toStringAsPrecision(4)}";
              classificacao = "Abaixo do peso";
            } else if (imc >= 18.6 && imc <= 24.9) {
              resultado = "Seu IMC é ${imc.toStringAsPrecision(4)}";
              classificacao = "Peso ideal";
            } else if (imc >= 25.0 && imc <= 29.9) {
              resultado = "Seu IMC é ${imc.toStringAsPrecision(4)}";
              classificacao = "Levemente acima do peso";
            } else if (imc >= 30.0 && imc <= 34.9) {
              resultado = "Seu IMC é ${imc.toStringAsPrecision(4)}";
              classificacao = "Obesidade Grau I";
            } else if (imc >= 35.0 && imc <= 39.9) {
              resultado = "Seu IMC é ${imc.toStringAsPrecision(4)}";
              classificacao = "Obesidade Grau II (Severa)";
            } else if (imc >= 40) {
              resultado = "Seu IMC é ${imc.toStringAsPrecision(4)}";
              classificacao = "Obesidade Grau II (Mórbida)";
            }
          });
        },
        child: Icon(Icons.calculate),
      ),
    );
  }
}
