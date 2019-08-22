import 'package:flutter/material.dart';
import '../help.dart';

class ButtonDemoPage extends StatefulWidget {
  @override
  _ButtonDemoPageState createState() => _ButtonDemoPageState();
}

class _ButtonDemoPageState extends State<ButtonDemoPage> {

  final Widget _floatingActionButton = FloatingActionButton(
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: AppUtils.tinColor,
//    shape: BeveledRectangleBorder(
//      borderRadius: BorderRadius.circular(10.0)
//    ),
    onPressed: () {

    },
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {

    },
    icon: Icon(Icons.add),
    label: Text('Add'),
    elevation: 0.0,
    backgroundColor: AppUtils.tinColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Buttons Demo"),
      ),

      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 49.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
      body: ButtonDemo(),
    );
  }
}



class ButtonDemo extends StatelessWidget {


  final _flatButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      FlatButton(
        child: Text('Button'),
        onPressed: () {

        },
        splashColor: Colors.grey,
        textColor: AppUtils.tinColor,
      ),

      FlatButton.icon(
        icon: Icon(Icons.add),
        label: Text("Button"),
        onPressed: () {

        },
        splashColor: Colors.grey,
        textColor: AppUtils.tinColor,

      ),
    ],
  );

  Widget _raiseButtonDemo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {

            },
            splashColor: Colors.grey,
//          textColor: AppUtils.tinColor,
            elevation: 0.0,
          ),
        ),

        SizedBox(width: 16.0,),

        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text("Button"),
          onPressed: () {

          },
          splashColor: Colors.grey,
          textColor: AppUtils.tinColor,
        ),
      ],
    );
  }

  Widget _outLineButtonDemo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          child: Expanded(
            child: OutlineButton(
              child: Text('Button'),
              onPressed: () {

              },
              splashColor: Colors.grey[100],
//          textColor: AppUtils.tinColor,
              borderSide: BorderSide(
                color: Colors.black54,
              ),
              textColor: Colors.black,
              highlightedBorderColor: Colors.grey,
            ),
          ),
        ),

        SizedBox(width: 16.0,),
//
        Expanded(
          flex: 2,
          child: OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("Button"),
            onPressed: () {

            },
            splashColor: Colors.grey,
            textColor: AppUtils.tinColor,
          ),
        ),
      ],
    );
  }

  Widget _buttonBarButtonDemo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 36.0),
                ),
              ),
              child: ButtonBar(
                children: <Widget>[
                  OutlineButton(
                    child: Text('Button'),
                    onPressed: () {

                    },
                    splashColor: Colors.grey[100],
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                    textColor: Colors.black,
                    highlightedBorderColor: Colors.grey,
                  ),
                  OutlineButton(
                    child: Text('Button'),
                    onPressed: () {

                    },
                    splashColor: Colors.grey[100],
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                    textColor: Colors.black,
                    highlightedBorderColor: Colors.grey,
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _flatButtonDemo,
          _raiseButtonDemo(context),
          _outLineButtonDemo(context),
          _buttonBarButtonDemo(context),
        ],
      ),
    );
  }
}

