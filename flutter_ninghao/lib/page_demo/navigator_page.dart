import 'package:flutter/material.dart';


class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Navigation Demo"),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: FlatButton(
                  child: Text("Home"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return HomeDemoPage();
                    }));
                  },
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: FlatButton(
                  child: Text("About"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/about");
//                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//                      return AboutDemoPage();
//                    }));

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Home Demo"),
      ),
      body: Container(
        child: Text(
          'Home Demo',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class AboutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("About Demo"),
      ),
      body: Container(
        child: Text(
          'About Demo',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

