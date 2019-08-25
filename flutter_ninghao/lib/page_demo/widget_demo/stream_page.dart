import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemoPage extends StatefulWidget {
  @override
  _StreamDemoPageState createState() => _StreamDemoPageState();
}

class _StreamDemoPageState extends State<StreamDemoPage> {

  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  StreamSink _streamSink;

  String _data = '...';

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Create a stream.");
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamController = StreamController<String>();
    _streamSink = _streamController.sink;

    print('Start listening on a stream.');
//    _streamSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);
//    _streamSubscription = _streamController.stream.listen(onData, onError: onError, onDone: onDone);

    print("Initialize completed.");
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return "hello ~";
//    throw 'Something happened!';
  }

  void onData(String data) {
    print('$data');
    
    setState(() {
      _data = data;
    });
  }

  void onError(error) {
    print("onError: $error");
  }

  void onDone() {
    print("Done!");
  }

  void _pauseStream() {
    print("Pause  subscription");
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print("Resume  subscription");
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print("Cancel  subscription");
    _streamSubscription.cancel();
  }

  void _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
//    _streamController.add(data);
    _streamSink.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Stream Demo"),
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_data),

              SizedBox(height: 32.0,),

              StreamBuilder(
                stream: _streamController.stream,
                initialData: "...",
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("Add"),
                    onPressed: _addDataToStream,
                  ),

                  FlatButton(
                    child: Text("Pause"),
                    onPressed: _pauseStream,
                  ),

                  FlatButton(
                    child: Text("Resume"),
                    onPressed: _resumeStream,
                  ),

                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: _cancelStream,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
