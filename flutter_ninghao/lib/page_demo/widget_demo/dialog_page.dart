import 'package:flutter/material.dart';
import '../../widges/touch_callback.dart';

enum Option {
  A, B, C
}

enum ZXXButtonHandler {
  OK, CANCEL
}

class DialogDemoPage extends StatefulWidget {
  @override
  _DialogDemoPageState createState() => _DialogDemoPageState();
}

class _DialogDemoPageState extends State<DialogDemoPage> {

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openSimpleDialog() async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialogDemoPage();
        }
    );

    print(result);
  }

  _openAlertDialog() async {
    final result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialogDemo();
      }
    );

    print(result);
  }

  _openBottomSheet() async {
    _bottomSheetScaffoldKey
        .currentState
        .showBottomSheet((BuildContext context) {
          return BottomSheetDemo();
    });


  }

  _openModalBottomSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomModalSheetDemo();
      },
    );
    print(result);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('DialogDemo'),
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Open AlertDialog"),
                  onPressed: _openAlertDialog,
                ),
              ],
            ),
            SizedBox(height: 20.0,),

            FlatButton(
              child: Text('Open BottomSheet'),
              onPressed: _openBottomSheet,
            ),

            SizedBox(height: 20.0,),

            FlatButton(
              child: Text('Modal BottomSheet'),
              onPressed: _openModalBottomSheet,
            ),

            SizedBox(height: 20.0,),
            SnackBarDemo(),

            SizedBox(height: 20.0,),
            ExpansionPanelDemo(),


          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}



class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {

  bool _isExpanded = false;
  List<ExpansionPanelItem> _list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _list = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: "Panel A",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A.'),
        ),
        isExpanded: false,
      ),

      ExpansionPanelItem(
        headerText: "Panel B",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
        ),
        isExpanded: false,
      ),

      ExpansionPanelItem(
        headerText: "Panel C",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        setState(() {
          _list[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: _list.map((ExpansionPanelItem item) {
        return ExpansionPanel(
          isExpanded: item.isExpanded,
          body: item.body,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              child: Text(
                item.headerText,
                style: Theme.of(context).textTheme.title,
              ),
            );
          }
        );
      }).toList(),
//      children: [
//        ExpansionPanel(
//          headerBuilder: (BuildContext context, bool isExpanded) {
//            return Container(
//              child: Text(
//                'Panel A',
//                style: Theme.of(context).textTheme.title,
//              ),
//            );
//          },
//          body: Container(
//            padding: EdgeInsets.all(16.0),
//            width: double.infinity,
//            child: Text('Content for Panel A.'),
//          ),
//          isExpanded: _isExpanded,
//
//        ),
//      ],
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}





class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    // 因为Scaffold.of的原因，这里需要添加builder。
    return Builder(
      builder: (BuildContext context) {
        return FlatButton(
          child: Text('Open SnackBar'),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Processing...'),
              action: SnackBarAction(
                label: "OK",
                onPressed: () {

                },
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        );
      },
    );
  }
}




class BottomModalSheetDemo extends StatefulWidget {
  @override
  _BottomModalSheetDemoState createState() => _BottomModalSheetDemoState();
}

class _BottomModalSheetDemoState extends State<BottomModalSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
//            alignment: Alignment.centerLeft,
            color: Colors.white,
            height: 50.0,
            width: double.infinity,
            child: TouchCallBack(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                alignment: Alignment.centerLeft,
                child: Text('Option A'),
              ),
              onPressed: (){
                print("点击了1");
                Navigator.pop(context, 0);
              },
            ),
          ),
          Container(
//            alignment: Alignment.centerLeft,
            color: Colors.white,
            height: 50.0,
            width: double.infinity,
            child: TouchCallBack(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                alignment: Alignment.centerLeft,
                child: Text('Option B'),
              ),
              onPressed: (){
                Navigator.pop(context, 1);
              },
            ),
          ),
          Container(
//            alignment: Alignment.centerLeft,
            color: Colors.white,
            height: 50.0,
            width: double.infinity,
            child: TouchCallBack(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                alignment: Alignment.centerLeft,
                child: Text('Option C'),
              ),
              onPressed: (){
                Navigator.pop(context, 2);
              },
            ),
          ),
        ],
      ),
    );
  }
}




class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 90.0,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.pause_circle_outline),
            SizedBox(width: 16.0,),
            Text("01:30 / 03:30"),
            Expanded(
              child: Text("Fix you - Coldplay", textAlign: TextAlign.right,),
            ),
          ],
        ),
      ),
    );
  }
}



class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text('AlertDialog'),
      content: Text("Are you sure about this?"),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context, ZXXButtonHandler.OK);
          },
        ),

        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context, ZXXButtonHandler.CANCEL);
          },
        ),
      ],
    );
  }
}



class SimpleDialogDemoPage extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemoPage> {


  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'SimpleDialog',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      titlePadding: EdgeInsets.fromLTRB(20, 16, 20, 0),
      backgroundColor: Colors.black.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      children: <Widget>[
        SimpleDialogOption(
          child: Text(
            "其他",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.pop(context, Option.A);
          },
        ),

        SimpleDialogOption(
          child: Text(
            "确认",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.pop(context, Option.B);
          },
        ),

        SimpleDialogOption(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Text(
              "关闭",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context, Option.C);
          },

        ),

      ],
    );
  }
}


