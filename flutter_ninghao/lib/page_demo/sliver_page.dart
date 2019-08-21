import 'package:flutter/material.dart';
import '../models/model_post.dart';

import "../help.dart";
import '../page_demo/navigator_page.dart';

class SliverPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title: Text('NINGHAO'),
            pinned: true,
            expandedHeight: 178.0,
            leading: MenuIconButton(),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Ninghao Flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                "https://resources.ninghao.net/images/overkill.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
//          SliverPadding(
//            padding: const EdgeInsets.all(8.0),
//            sliver: SliverListDemo(),
//          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
            sliver: SliverGridDemo(),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(posts[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            posts[index].author,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return NavigatorPage();
                  }));
                },
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20.0,
        childAspectRatio: 5.0 / 3.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[

                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(posts[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),

                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            posts[index].author,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return NavigatorPage();
                  }));
                },
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

