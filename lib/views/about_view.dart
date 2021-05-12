import 'package:flutter/material.dart';

class AboutViewWidget extends StatefulWidget {
  @override
  AboutViewWidgetState createState() => AboutViewWidgetState();
}

class AboutViewWidgetState extends State<AboutViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image:
                        AssetImage('dev_assets/icone_calculadora_de_imc.png'),
                    height: 75,
                  ),
                ),
                Text("Calculadora de IMC v0.0.4"),
              ],
            ),
          ),
          Divider(
            color: Color(0xFF959595),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text("Feito com amor ❤️\npor Alexander Andrade Cerlini",
                textAlign: TextAlign.center),
          ),
          Divider(
            color: Color(0xFF959595),
          ),
        ],
      ),
    );
  }
}
