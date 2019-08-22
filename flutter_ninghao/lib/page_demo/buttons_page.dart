import 'package:flutter/material.dart';

class ButtonDemoPage extends StatefulWidget {
  @override
  _ButtonDemoPageState createState() => _ButtonDemoPageState();
}

class _ButtonDemoPageState extends State<ButtonDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Buttons Demo"),
      ),
      body: Container(),
    );
  }
}
