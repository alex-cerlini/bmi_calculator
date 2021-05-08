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
    );
  }
}
