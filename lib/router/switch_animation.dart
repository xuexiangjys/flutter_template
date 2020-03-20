import 'package:flutter/material.dart';
import 'route_map.dart';

//右进右出动画
class SlidePageRoute extends PageRouteBuilder {
  final String routeName;
  final Widget widget;
  final int duration;

  SlidePageRoute({this.routeName, this.widget, this.duration = 800})
      : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget != null ? widget : RouteMap.routes[routeName](context);
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        //1.0为右进右出，-1.0为左进左出
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
