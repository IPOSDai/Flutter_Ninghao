import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isfee;
  final Color color;

  TouchCallBack({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.isfee: true,
    this.color: const Color(0xffd8d8d8),
  }): super(key: key);

  @override
  _TouchCallBackState createState() => _TouchCallBackState();
}

class _TouchCallBackState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d) {
        if (widget.isfee == false) return;
        setState(() {
          color = widget.color;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
      onPanEnd: (d) {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}