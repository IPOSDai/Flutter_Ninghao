import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManageDemoPage extends StatefulWidget {
  @override
  _StateManageDemoPageState createState() => _StateManageDemoPageState();
}

class _StateManageDemoPageState extends State<StateManageDemoPage> {

  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0.0,
          title: Text("StateManage Demo"),
        ),

        body: CounterWrapper(),

        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: model.increaseCount,
            );
          },
        ),

//      body: CounterProvider(
//        count: _count,
//        increaseCount: _increaseCount,
//        child: CounterWrapper(),
//      ),

//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),
//          onPressed: () {
//            setState(() {
//              _count += 1;
//            });
//          },
//        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}



class Counter extends StatelessWidget {


  Counter();

  @override
  Widget build(BuildContext context) {

//    final int count = CounterProvider.of(context).count;
//    final VoidCallback increassseCount = CounterProvider.of(context).increaseCount;

    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) {
        return ActionChip(
          label: Text('${model.count}'),
          onPressed: () {
            model.increaseCount();
          },
        );
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child
  }) : super(child: child);

  static CounterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}


class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}


