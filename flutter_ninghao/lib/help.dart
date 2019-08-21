import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> mainScaffoldKey = new GlobalKey<ScaffoldState>();

class MenuIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu ),
      onPressed: () {
        mainScaffoldKey.currentState.openDrawer();
      },
    );
  }
}


class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
