import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Http Demo"),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    fetchData()
//      .then((value) => print(value));


//    final post = {
//      'title': 'hello',
//      'description': 'nice to meet you.',
//    };
//
//    final postJson = json.encode(post);
//    print(postJson);
//
//    final postJsonConverted = json.decode(postJson);
//    print(postJsonConverted['title']);
//    print(postJsonConverted['description']);
//    print(postJsonConverted is Map);
//
//    final postModel = Post.fromJson(postJsonConverted);
//    print('${postModel.title} : ${postModel.description}');
//
//    print('${json.encode(postModel)}');

  }

  Future<List<Post>> fetchData() async {
    final response = await http.get("https://resources.ninghao.net/demo/posts.json");

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
      .map<Post>((item) => Post.fromJson(item))
      .toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
//        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        } else {
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text('${item.title}'),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}


class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
      this.id,
      this.title,
      this.description,
      this.author,
      this.imageUrl,
      );

  Post.fromJson(Map json) :
        id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];


  Map toJson() {
    return {
      'title': title,
      'descriptiion': description,
    };
  }
}





