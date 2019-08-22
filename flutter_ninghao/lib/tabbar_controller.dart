import 'package:flutter/material.dart';
import './page_demo/home_page.dart';
import './page_demo/history_page.dart';
import './page_demo/sliver_page.dart';
import './page_demo/demos_page.dart';

class TabbarPage extends StatefulWidget {

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {

  var _currentIndex = 0;

  HomePage _homePage;
  HistoryPage _historyPage;
  SliverPageView _sliverPage;
  DemosPage _demosPage;


  _getBoddy() {
    switch (_currentIndex) {
      case 0:
        if (_homePage == null) {
          _homePage = HomePage();
        }
        return _homePage;

      case 1:
        if (null == _sliverPage) {
          _sliverPage = SliverPageView();
        }
        return _sliverPage;

      case 2:
        if (_historyPage == null) {
          _historyPage = HistoryPage();
        }
        return _historyPage;

      case 3:
        if (_demosPage == null) {
          _demosPage = DemosPage();
        }
        return _demosPage;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBoddy(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text("Explore"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text("Demos"),
          ),

        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
