import 'package:flutter/material.dart';


class MDCDemoPage extends StatefulWidget {
  @override
  _MDCDemoPageState createState() => _MDCDemoPageState();
}

class _MDCDemoPageState extends State<MDCDemoPage> {

  List<String> _tags = [
    "Apple",
    "Orange",
    "Banana",
    "Lemon",
  ];

  String _selectAction = "Nothing";

  List<String> _selected = [];

  String _choice = "Apple";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("MDC Demo"),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(
                    label: Text('List'),
                  ),

                  Chip(
                    label: Text('Sunset'),
                    backgroundColor: Colors.blueAccent,
                  ),

                  Chip(
                    label: Text('嘴巴嘟嘟嘟，嘟...'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text("嘟"),
                    ),
                  ),

                  Chip(
                    label: Text('美女头像'),
                    avatar: CircleAvatar(
//                    backgroundColor: Colors.grey,
//                    child: Text("嘟"),
                      backgroundImage: NetworkImage(
                          'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1566620729&di=46e5ba0efe69566c2d55456335981b33&src=http://b-ssl.duitang.com/uploads/item/201411/28/20141128175051_dU3RX.jpeg'
                      ),
                    ),
                  ),

                  Chip(
                    label: Text('City'),
                    onDeleted: () {
                    },
                    deleteIcon: Icon(Icons.delete),
                    deleteIconColor: Colors.redAccent,
                    deleteButtonTooltipMessage: 'Remove this Tag!',
                  ),

                  Divider(
                    color: Colors.grey,
                    height: 32.0,
                    indent: 32.0,
                  ),

                ],
              ),

              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                children: _tags.map((String tag) {
                  return Chip(
                    label: Text(tag),
                    onDeleted: () {
                      setState(() {
                        _tags.remove(tag);
                      });
                    },
                  );
                }).toList(),
              ),

              Divider(
                color: Colors.grey,
                height: 32.0,
                indent: 32.0,
              ),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) {
                  return ActionChip(
                    label: Text(tag),
                    onPressed: () {
                      setState(() {
                        _selectAction = tag;
                      });
                    },
                  );
                }).toList(),
              ),
              Container(
                child: Text('ActionChip: $_selectAction'),
              ),

              Divider(
                color: Colors.grey,
                height: 32.0,
                indent: 32.0,
              ),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) {
                  return FilterChip(
                    label: Text(tag),
                    selected: _selected.contains(tag),
                    onSelected: (value) {
                      setState(() {
                        if (_selected.contains(tag)) {
                          _selected.remove(tag);
                        } else {
                          _selected.add(tag);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              Container(
                child: Text('FilterChip: ${_selected.toString()}'),
              ),

              Divider(
                color: Colors.grey,
                height: 32.0,
                indent: 32.0,
              ),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) {
                  return ChoiceChip(
                    selectedColor: Colors.blueAccent,
                    label: Text(
                      tag,
                      style: TextStyle(
                        color: _choice == tag ? Colors.white : Colors.black87,
                      ),
                    ),
                    selected: _choice == tag,
                    onSelected: (value) {
                      setState(() {
                        _choice = tag;
                      });
                    },
                  );
                }).toList(),
              ),
              Container(
                child: Text('ChoidChip: $_choice'),
              ),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
//            _tags.addAll([
//              "Apple",
//              "Orange",
//              "Banana",
//              "Lemon",
//            ]);

          _tags = [
            "Apple",
            "Orange",
            "Banana",
            "Lemon",
          ];

            _selected = [];
            _choice = "Apple";
          });
        },
      ),
    );
  }
}

