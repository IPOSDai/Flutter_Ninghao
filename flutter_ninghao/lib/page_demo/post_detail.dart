import 'package:flutter/material.dart';

import '../models/model_post.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  PostDetailPage({
    @required this.post,
  });

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 178.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '${widget.post.title}',
              ),
              background: Image.network(
                "${widget.post.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
            sliver: SliverGridDemo(post:widget.post),
          ),
        ],
      ),
    );
  }
}


class SliverGridDemo extends StatelessWidget {

  final Post post;
  SliverGridDemo({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
//    return  Container(
//      width: 200,
//      height: 200,
//      color: Colors.green,
//    );
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Text('${post.title}', style: Theme.of(context).textTheme.title,),
              Text('${post.author}', style: Theme.of(context).textTheme.subhead,),
              SizedBox(height: 32.0,),
              Text('${post.description}', style: Theme.of(context).textTheme.subtitle,),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }
}
