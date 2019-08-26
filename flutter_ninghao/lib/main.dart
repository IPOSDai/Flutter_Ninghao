import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/drawer_demo.dart';
import './tabbar_controller.dart';
import 'package:flutter/services.dart';

import './page_demo/navigator_page.dart';

import './help.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ninghao/locale_supports/local_utils.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ZXXApp());
  });
}


class ZXXApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    // TODO: implement build
    return MaterialApp(
//      locale: Locale('en', "US"),
      locale: Locale('zh', "CN"),
//      localeResolutionCallback: (Locale locale, Iterable<Locale> supports) {
//        return Locale('en', "US");
//      },
      localizationsDelegates: [
        LocaleDemoDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppUtils.tinColor,
        primaryColor: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
      home: Home(),
      routes: {
        '/about': (context) => AboutDemoPage(),
      },
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
