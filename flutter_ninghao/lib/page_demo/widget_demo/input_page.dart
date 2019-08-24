import 'package:flutter/material.dart';
import '../../help.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class InputDemoPage extends StatefulWidget {
  @override
  _InputDemoPageState createState() => _InputDemoPageState();
}

class _InputDemoPageState extends State<InputDemoPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Input Demo"),
      ),

      body: DateTimeDemo(),
    );
  }
}


class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 10, minute: 5);

  _selectdDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    setState(() {
      selectedDate = date;
    });
  }

  _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (null == time) return;
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: _selectdDate,
                child: Row(
                  children: <Widget>[
                    Text(DateFormat.yMMMMd().format(selectedDate)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),

              SizedBox(width: 32.0,),

              InkWell(
                onTap: _selectTime,
                child: Row(
                  children: <Widget>[
                    Text(selectedTime.format(context)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}



class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {

  double _sliderItemA = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Slider(
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                  value: _sliderItemA,
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                ),
              ),

            ],
          ),

          SizedBox(height: 16.0,),
          Text('SliderValue: ${_sliderItemA.toInt()}'),
        ],
      ),
    );
  }
}


class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {

  bool _switchItemA = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SwitchListTile(
            value: _switchItemA,
            onChanged: (value) {
              setState(() {
                _switchItemA = value;
              });
            },
            title: Text('Switch Item A'),
            subtitle: Text("Description"),
            secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
            selected: _switchItemA,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Text(_switchItemA ? "可用" : "不可用"),
//
//              SizedBox(height: 32.0,),

//              Switch(
//                value: _switchItemA,
//                onChanged: (value) {
//                  setState(() {
//                    _switchItemA = value;
//                  });
//                },
//              ),
            ],
          ),
        ],
      ),
    );
  }
}



class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {

  int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("RadioGroupValue: $_radioGroupA"),
          SizedBox(height: 32.0,),
          RadioListTile(
            value: 0,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            title: Text('Options A'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_1),
            selected:  _radioGroupA == 0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            title: Text('Options B'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_2),
            selected:  _radioGroupA == 1,
          ),

          RadioListTile(
            value: 2,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            title: Text('Options B'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_3),
            selected:  _radioGroupA == 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Radio(
//                value: 0,
//                groupValue: _radioGroupA,
//                onChanged: _handleRadioValueChanged,
//
//              ),
//              Radio(
//                value: 1,
//                groupValue: _radioGroupA,
//                onChanged: _handleRadioValueChanged,
//              ),
            ],
          ),
        ],
      ),
    );
  }
}



class CheckBoxDemo extends StatefulWidget {


  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkboxItemA = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CheckboxListTile(
            value: _checkboxItemA,
            onChanged: (value) {
              setState(() {
                _checkboxItemA = value;
              });
            },
            title: Text("CheckBox Item A"),
            subtitle: Text("Description"),
            secondary: Icon(Icons.bookmark),
            selected: _checkboxItemA,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//                Checkbox(
//                  value: _checkboxItemA,
//                  onChanged: (value) {
//                    setState(() {
//                      _checkboxItemA = value;
//                    });
//                  },
////                  activeColor: Colors.black,
//                ),
            ],
          ),
        ],
      ),
    );
  }
}
