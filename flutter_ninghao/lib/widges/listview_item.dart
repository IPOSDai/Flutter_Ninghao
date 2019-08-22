import 'package:flutter/material.dart';
import './touch_callback.dart';

class ListViewItem extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final double height;

  ListViewItem({
    Key key,
    this.title = "",
    this.onPressed,
    this.height = 45.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: TouchCallBack(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: height - 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1.0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                      ),
                    ),

                    Image.asset(
                      "images/arrow_right.png",
                      color: Colors.grey[500],
                      width: 20.0,
                      height: 20.0,
                    ),
                  ],

                ),
              ),
            ),

            Container(
              height: 1.0,
              color: Colors.grey[100],
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
