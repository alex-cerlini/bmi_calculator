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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('dev_assets/icone_calculadora_de_imc.png'),
                ),
                Text("Calculadora de IMC v0.0.3"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
