import 'package:flutter/material.dart';
import '../../models/model_post.dart';

class DataTableDemoPage extends StatefulWidget {
  @override
  _DataTableDemoPageState createState() => _DataTableDemoPageState();
}

class _DataTableDemoPageState extends State<DataTableDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Demo'),
        elevation: 0.0,
      ),
//      body: SampleDataTableDemo(),
//      body: PostDataDemo1(),
//      body: PaginatedDataTableDemo(),
//      body: CardDemo(),
      body: StepperDemo(),
    );

  }
}

class SampleDataTableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                  label: Text("title")
              ),
              DataColumn(
                  label: Text("title")
              )
            ],

            rows: [
              DataRow(
                  cells: [
                    DataCell(
                        Text("Hello ")
                    ),

                    DataCell(
                        Text("Hello ")
                    ),
                  ]
              ),

              DataRow(
                  cells: [
                    DataCell(
                        Text("Hello1")
                    ),

                    DataCell(
                        Text("Hello ")
                    ),
                  ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class PostDataDemo1 extends StatefulWidget {
  @override
  _PostDataDemo1State createState() => _PostDataDemo1State();
}

class _PostDataDemo1State extends State<PostDataDemo1> {

  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
//            onSelectAll: (bool value) {},
            columns: [
              DataColumn(
                label: Text("Title"),
                onSort: (int index, bool ascending) {
                  setState(() {
                    _sortColumnIndex = index;
                    _sortAscending = ascending;

                    posts.sort((a, b) {
                      if (!ascending) {
                        final c = a;
                        a = b;
                        b = c;
                      }
                      return a.title.length.compareTo(b.title.length);
                    });
                  });
                }
              ),
              DataColumn(
                  label: Text("Author")
              ),
              DataColumn(
                  label: Text("Image")
              )
            ],

            rows: posts.map((post) {
              return DataRow(
                selected: post.selected,
                onSelectChanged: (bool value) {
                  setState(() {
                    post.selected = value;
                  });
                },
                cells: [
                  DataCell(Text(post.title)),
                  DataCell(Text(post.author)),
                  DataCell(Image.network(post.imageUrl)),
                ]
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}



class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Container(
          width: 100,
          child: Text(post.title),
        )),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  sort(getField(post), bool  ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }


}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          PaginatedDataTable(
            header: Text('Posts'),
            rowsPerPage: 15,
            source: _postsDataSource,
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
//            onSelectAll: (bool value) {},
            columns: [
              DataColumn(
                  label: Text("Title"),
                  onSort: (int columnIndex, bool ascending) {
                    _postsDataSource.sort((post) => post.title.toString().toUpperCase(), ascending);

                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                    });
                  }
              ),
              DataColumn(
                  label: Text("Author")
              ),
              DataColumn(
                  label: Text("Image")
              )
            ],


          ),
        ],
      ),
    );
  }
}



class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: posts.map((post) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.imageUrl),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),

                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    post.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Like'.toUpperCase()),
                        onPressed: (){},
                      ),

                      FlatButton(
                        child: Text('Read'.toUpperCase()),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}


class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.black,
            ),
            child: Stepper(
              currentStep: _currentStep,
              onStepTapped: (int value) {
                setState(() {
                  _currentStep = value;
                });
              },
              onStepContinue: () {
                setState(() {
                  _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                });
              },

              steps: [
                Step(
                  title: Text('Login'),
                  subtitle: Text('Login first'),
                  content: Text('Magna exercitation duis non sint eu nostrud.'),
                  isActive: true,
                ),

                Step(
                  title: Text('Choose Plan'),
                  subtitle: Text('Choose you plan.'),
                  content: Text('Magna exercitation duis non sint eu nostrud.'),
                  isActive: true,
                ),

                Step(
                  title: Text('Confirm payment'),
                  subtitle: Text('Confirm you payment method.'),
                  content: Text('Magna exercitation duis non sint eu nostrud.'),
                  isActive: true,
                ),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
