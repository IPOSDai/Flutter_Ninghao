import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/drawer_demo.dart';
import './tabbar_controller.dart';

import './help.dart';

void main() => runApp(ZXXApp());


class ZXXApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
      home: Home(),
    );
  }
}



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: mainScaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: DrawerDemo(
        username: "daishuyi",
        useremail: "daishuyi@163.com",
        avatarUrl: 'https://resources.ninghao.org/images/wanghao.jpg',
        headerUrl: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
        onSelected: (int index) {
          switch (index) {
            case 0:
              print("Message selected");
              break;
            case 1:
              print("Favorite selected");
              break;
            case 2:
              print("Setting selected");
              break;
            default:
              print("Default other");
              break;
          }
        },
      ),
      body: TabbarPage(),
    );
  }



//    return Scaffold(
//      backgroundColor: Colors.grey[100],
//      appBar: AppBar(
//        title: Text("NINGHAO"),
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          tooltip: 'Navigation',
//          onPressed: () {
//            print("Navigation menu");
//          },
//        ),
//
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: () {
//              print("search button");
//            },
//          ),
//        ],
//      ),
//
//      body: ListViewDemo(),
//    );
//  }
}
