import 'package:flutter/material.dart';
import 'package:flutter_template/page/home/about.dart';
import 'package:flutter_template/page/home/home.dart';
import 'package:flutter_template/page/home/login.dart';
import 'package:flutter_template/page/home/sponsor.dart';

///页面路由映射表
class RouteMap {

  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => MainHomePage(),
    '/login': (BuildContext context) => LoginPage(),
    '/about': (BuildContext context) => AboutPage(),
    '/sponsor': (BuildContext context) => SponsorPage(),

  };


}
