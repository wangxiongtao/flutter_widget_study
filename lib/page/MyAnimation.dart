import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyDialog.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/8/10
/// 作者：Dawn
class MyAnimation extends StatefulWidget {
  MyAnimation({Key key}) : super(key: key);

  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Animation<double> animationMove;
  AnimationController controllerMove;
  double w, h;
  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInSine);
    animation = new Tween(begin: 1.0, end: .5).animate(animation);
//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        //动画执行结束时反向执行动画
//        controller.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        //动画恢复到初始状态时执行动画（正向）
//        controller.forward();
//      }
//    });

    controllerMove = new AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animationMove =
        CurvedAnimation(parent: controllerMove, curve: Curves.bounceOut);
    animationMove = new Tween(begin: 0.0, end: 250.0).animate(animationMove);
//    animationMove.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        //动画执行结束时反向执行动画
//        controllerMove.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        //动画恢复到初始状态时执行动画（正向）
//        controllerMove.forward();
//      }
//    });
//    animation.addListener(() {
//      print("==animation====>${animation.value}");
//      setState(() {
////        w=animation.value;
////        h=animation.value;
//      });
//    });
  }

  @override
  Widget build(BuildContext context1) {
    return BaseMaterialApp(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            child: Text("动画"),
            onPressed: () async {
              await controller.forward();
//              await controller.repeat().orCancel;
//              await controller.reverse().orCancel;
            },
          ),
          Container(
            width: w,
            height: h,
            color: Colors.red,
          ),
          ScaleTransition(
            scale: animation,
//            child:  RaisedButton(child: Text("动画"),onPressed: ()=> controller.forward(),),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
              width: 100,
              height: 100,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(FadeRoute());
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.deepPurple,
              child: Text("路由切换动画"),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          RaisedButton(
            child: const Text(
              '+1',
            ),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          ),
          AnimatedBuilder(
            animation: animationMove,
            child: RaisedButton(
              child: Text("抛物线动画"),
              onPressed: () {
                controller.forward();
                controllerMove.forward();
                ToastUtil.toast("start");
              },
            ),
            builder: (BuildContext ctx, Widget child) {
              double x = animationMove.value;
//              print("==AnimatedBuilder===x===$x");
              return Transform.translate(
                child: ScaleTransition(
                  scale: animation,
//            child:  RaisedButton(child: Text("动画"),onPressed: ()=> controller.forward(),),
                  child: child,
                ),
                offset: Offset(x, (x * x) / 250),
              );
            },
          ),
        ],
      ),
    );
  }

  to() {
    Navigator.of(context).push(FadeRoute());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controllerMove.dispose();
    super.dispose();
  }
}

class FadeRoute extends PageRouteBuilder {
  FadeRoute()
      : super(
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return ScaleTransition(
                scale: animation,
                child: RotationTransition(
                  turns: animation,
                  child: AnimatedWidgetsTest(),
                ),
              );
            },
            transitionDuration: Duration(milliseconds: 1000));
}

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              duration: duration,
              padding: EdgeInsets.all(_padding),
              child: Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: duration,
                  left: _left,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: Text("AnimatedPositioned"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _align,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _height = 150;
                  _color = Colors.blue;
                });
              },
              child: Text(
                "AnimatedContainer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: Text("hello world"),
              onTap: () {
                setState(() {
                  _style = TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blue,
                  );
                });
              },
            ),
            style: _style,
            duration: duration,
          ),
          AnimatedDecoratedBox(
            duration: duration,
            decoration: BoxDecoration(color: _decorationColor),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _decorationColor = Colors.red;
                });
              },
              child: Text(
                "AnimatedDecoratedBox",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ].map((e) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: e,
          );
        }).toList(),
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
    Duration reverseDuration, // 反向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
//    reverseDuration:reverseDuration
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}

class MyTwoCurve extends Curve {
  @override
  double transform(double t) {
    // TODO: implement transform
    return super.transform(t);
  }
}
