import 'package:flutter/material.dart';


typedef void DrawerDemoCallBack(int index);

class DrawerDemo extends StatelessWidget {

  final String avatarUrl;
  final String username;
  final String useremail;
  final String headerUrl;

  final DrawerDemoCallBack onSelected;

  DrawerDemo({
    Key key,
    this.avatarUrl,
    this.username,
    this.useremail,
    this.headerUrl,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView (
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(username, style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text(useremail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage(headerUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),

          Container(
            color: Colors.transparent,
            height: 40.0,
          ),

          Divider(
            color: Colors.black54,
            height: 1.0,
          ),
          ListTile(
            title: Text("Message", textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0,),
            onTap: () {
              Navigator.pop(context);
              onSelected(0);
            },
          ),
          Divider(
            color: Colors.black54,
            height: 1.0,
          ),

          ListTile(
            title: Text("Favorite", textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0,),
            onTap: () {
              Navigator.pop(context);
              onSelected(1);
            },
          ),

          Divider(
            color: Colors.black54,
            height: 1.0,
          ),

          ListTile(

            title: Text("Settings", textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0,),
            onTap: () {
              Navigator.pop(context);
              onSelected(2);
            },
          ),

          Divider(
            color: Colors.black54,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}