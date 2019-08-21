import 'package:flutter/material.dart';

import '../demo/listview_demo.dart';

import '../help.dart';
import '../demo/basic_demo.dart';
import '../demo/layout_demo.dart';
import '../demo/view_demo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0.0,
          title: Text("NINGHAO"),
          leading: IconButton(
            icon: Icon(Icons.menu ),
            onPressed: () {
              mainScaffoldKey.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                print("search button");
              },
            ),
          ],

          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
//            Icon(Icons.change_history, size: 128.0, color: Colors.black12,),
//            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12,),
          ],
        ),
      ),
    );
  }
}
