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

class AppUtils {
  static const int _tinColorPrimaryValue = 0xff0059f1;

  static const MaterialColor tinColor = MaterialColor(
    _tinColorPrimaryValue,
  <int, Color>{
    50: Color(_tinColorPrimaryValue),
    100: Color(_tinColorPrimaryValue),
    200: Color(_tinColorPrimaryValue),
    300: Color(_tinColorPrimaryValue),
    400: Color(_tinColorPrimaryValue),
    500: Color(_tinColorPrimaryValue),
    600: Color(_tinColorPrimaryValue),
    700: Color(_tinColorPrimaryValue),
    800: Color(_tinColorPrimaryValue),
    900: Color(_tinColorPrimaryValue),
    },
  );
}

