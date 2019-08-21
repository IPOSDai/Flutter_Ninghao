import 'package:flutter/material.dart';
import '../help.dart';

import '../models/model_post.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("NINGHAO"),
        leading: MenuIconButton(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              posts[0].imageUrl,
            ),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),

      ),
    );
  }
}
