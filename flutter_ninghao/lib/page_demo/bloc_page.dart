import 'package:flutter/material.dart';
import 'dart:async';

class BlocDemoPage extends StatefulWidget {
  @override
  _BlocDemoPageState createState() => _BlocDemoPageState();
}

class _BlocDemoPageState extends State<BlocDemoPage> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Bloc Demo"),
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {

  final Widget child;
  final CounterBloc bloc;

  const CounterProvider({
    Key key,
    @required this.child,
    this.bloc,
  })
      : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
        child: StreamBuilder(
          initialData: 0,
          stream: _counterBloc.count,
          builder: (context, snapshot) {
            return ActionChip(
              label: Text("${snapshot.data}"),
              onPressed: () {
                _counterBloc.counter.add(1);
              },
            );
          },
        ),
//      child: ActionChip(
//        label: Text('0'),
//        onPressed: () {
////          _counterBloc.log();
//          _counterBloc.counter.add(1);
//        },
//      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
//        _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterBloc {

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;
  final _counterControoler = StreamController<int>();
  Stream<int> get count => _counterControoler.stream;

  int _count = 0;
  
  CounterBloc() {
    _counterActionController.stream.listen(onData);
//    _counterControoler.stream.listen(onData);
  }


  void dispose() {
//    _counterActionController.close();
    _counterControoler.close();
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterControoler.add(_count);
  }

  void log() {
    print('Bloc');
  }
}


