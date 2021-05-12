import 'package:calculadora_de_imc/views/about_view.dart';
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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var weightInput = TextEditingController();
  var heightInput = TextEditingController();
  var weight = 0.0;
  var weightIdeal = 0.0;
  var maxWeightIdeal = 0.0;
  var height = 0.0;
  var bmi = 0.0;
  var result = "Por favor, entre com seu peso e altura";
  var classification = "Aguardando dados";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text("Menu"),
              ),
            ),
            ListTile(
              title: Text("Sobre"),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutViewWidget(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
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
                  weightInput.text = "";
                  heightInput.text = "";
                  weight = 0.0;
                  height = 0.0;
                  bmi = 0.0;
                  result = "Por favor, entre com seu peso e altura";
                  classification = "Aguardando dados";
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
                controller: weightInput,
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
                controller: heightInput,
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Text("$result"),
            Text("Classificação:  $classification"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      height = double.tryParse(heightInput.text);
                      weightIdeal = 18.5 * (height * height) / 10000;
                      maxWeightIdeal = 24.9 * (height * height) / 10000;
                      setState(() {
                        result =
                            "Seu peso ideal é entre ${weightIdeal.toStringAsPrecision(4)}kg e ${maxWeightIdeal.toStringAsPrecision(4)}kg";
                        classification = "-";
                      });
                    },
                    child: Text('Faixa Ideal',
                        style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF64FEDA),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (weightInput.text.isEmpty ||
                            heightInput.text.isEmpty) {
                          return;
                        }
                        weight = double.tryParse(weightInput.text);
                        height = double.tryParse(heightInput.text);
                        bmi = (weight / (height * height)) * 10000;

                        if (bmi <= 0) {
                          result = "Por favor, entre com seu peso e altura";
                        } else if (bmi > 0 && bmi <= 18.5) {
                          result = "Seu IMC é ${bmi.toStringAsPrecision(4)}";
                          classification = "Abaixo do peso";
                        } else if (bmi >= 18.6 && bmi <= 24.9) {
                          result = "Seu IMC é ${bmi.toStringAsPrecision(4)}";
                          classification = "Peso ideal";
                        } else if (bmi >= 25.0 && bmi <= 29.9) {
                          result = "Seu IMC é ${bmi.toStringAsPrecision(4)}";
                          classification = "Levemente acima do peso";
                        } else if (bmi >= 30.0 && bmi <= 34.9) {
                          result = "Seu IMC é ${bmi.toStringAsPrecision(4)}";
                          classification = "Obesidade Grau I";
                        } else if (bmi >= 35.0 && bmi <= 39.9) {
                          result = "Seu IMC é ${bmi.toStringAsPrecision(4)}";
                          classification = "Obesidade Grau II (Severa)";
                        } else if (bmi >= 40) {
                          result = "Seu IMC é ${bmi.toStringAsPrecision(4)}";
                          classification = "Obesidade Grau III (Mórbida)";
                        }
                      });
                    },
                    child:
                        Text('Calcular', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF64FEDA),
                    ),
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
