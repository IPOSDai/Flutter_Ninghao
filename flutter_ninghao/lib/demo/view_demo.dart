import 'package:flutter/material.dart';
import '../models/model_post.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(50.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

class GridViewExtendDemo extends StatelessWidget {

  List<Widget> _buildTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Text(
          'item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: _buildTitles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {

  List<Widget> _buildTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Text(
          'item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: _buildTitles(100),
    );
  }
}


class PageViewBuilderDemo extends StatelessWidget {

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}


class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
//      pageSnapping: false,
//      reverse: true,
//      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) {
        debugPrint('Page: $currentPage');
      },
      controller: PageController(
        initialPage: 0,
        keepPage: false,
        viewportFraction: 1.0,
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment.center,
          child: Text(
            'ONE',
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
            ),
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(
            'TWO',
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
            ),
          ),
        ),
        Container(
          color: Colors.cyan[900],
          alignment: Alignment.center,
          child: Text(
            'THREE',
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
