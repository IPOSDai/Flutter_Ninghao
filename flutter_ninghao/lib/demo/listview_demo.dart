import 'package:flutter/material.dart';
import '../page_demo/post_detail.dart';
import '../models/model_post.dart';


class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover,),
              ),
              SizedBox(height: 16.0,),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),

              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle,
              ),
              SizedBox(height: 16.0,),
            ],
          ),

          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return PostDetailPage(post: posts[index]);
                      },
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}