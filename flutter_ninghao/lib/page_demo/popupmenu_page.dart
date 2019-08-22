import 'package:flutter/material.dart';

class PopupMenuPage extends StatefulWidget {
  @override
  _PopupMenuPageState createState() => _PopupMenuPageState();
}

class _PopupMenuPageState extends State<PopupMenuPage> {

  var currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Popup Menu Demo"),
      ),

      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${currentValue}"),

                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      currentValue = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Text("Home"),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Text("Add"),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Remove"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
