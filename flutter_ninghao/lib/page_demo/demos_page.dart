import 'package:flutter/material.dart';
import "../help.dart";

import 'form_page.dart';

import '../widges/listview_item.dart';


class DemosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("DEMOS"),
        leading: MenuIconButton(),
      ),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            height: 54.0,
            title: 'Form Input Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FormPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Form Input Demo',
            onPressed: () {
              debugPrint("Form Input Demo");
            },
          ),
        ],
      ),
    );
  }
}
