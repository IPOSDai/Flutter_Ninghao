import 'package:flutter/material.dart';

class AnimationDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Animation Demo"),
      ),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> with TickerProviderStateMixin {

  AnimationController _controller;
  Animation animation;
  Animation colorAnimation;

  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
//      value: 32.0,
//      lowerBound: 32.0,
//      upperBound: 100.0,
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    animation = Tween(
      begin: 32.0,
      end: 100.0,
    ).animate(curvedAnimation);

    colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.red[900],
    ).animate(curvedAnimation);
    

//    _controller.addListener(() {
////      print('${_controller.value}');
//       setState(() {
//
//       });
//    });
    _controller.addStatusListener((AnimationStatus status) => print('$status'));

//    _controller.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [animation, colorAnimation],
        controller: _controller,
      ),
//      child: IconButton(
//        icon: Icon(Icons.favorite),
//        iconSize: animation.value,
//        color: colorAnimation.value,
//        onPressed: () {
////          _controller.forward();
//          switch (_controller.status) {
//            case AnimationStatus.completed:
//              _controller.reverse();
//              break;
//            default:
//              _controller.forward();
//              break;
//
//          }
//        },
//      ),

//      child: ActionChip(
//        label: Text("${_controller.value}"),
//        onPressed: () {
//          _controller.forward();
//        },
//      ),
    );
  }
}


class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
//          _controller.forward();
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
            break;

        }
      },
    );
  }

}
