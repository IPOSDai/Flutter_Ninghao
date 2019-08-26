import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class RxDartDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("RxDart Demo"),
      ),

      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  PublishSubject<String> _textFieldSubjuect;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//
//    Observable<String> _observable =
//       Observable(Stream.fromIterable(['Hello', '您好']));
//       Observable.fromFuture(Future.value('Hello ~'));
//       Observable.fromIterable(["Hello", "您好"]);
//       Observable.just("Hello");
//       Observable.periodic(Duration(seconds: 3), (x) => x.toString());
//
//    _observable.listen(print);

//    PublishSubject<String> _subject = PublishSubject<String>();
//    BehaviorSubject<String> _subject = BehaviorSubject<String>();
//    ReplaySubject<String> _subject = ReplaySubject<String>();
//
//     _subject.add("Hello, Every boday!");
//    _subject.add("Over");
//    _subject.listen((data) => print('listen 1: $data'));
//    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
//
//
//    _subject.close();

    _textFieldSubjuect = PublishSubject<String>();
    _textFieldSubjuect
//        .map((item) => "Item: $item")
//        .where((item) => item.length > 9)
        .debounceTime(Duration(milliseconds: 500))
        .listen((data) => print(data));
    
    



  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textFieldSubjuect.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubjuect.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubjuect.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}



