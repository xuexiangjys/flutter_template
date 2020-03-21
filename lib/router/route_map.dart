import 'package:flutter/material.dart';
import 'package:flutter_template/page/index.dart';
import 'package:flutter_template/page/menu/about.dart';
import 'package:flutter_template/page/menu/login.dart';
import 'package:flutter_template/page/menu/register.dart';
import 'package:flutter_template/page/menu/sponsor.dart';

///页面路由映射表
class RouteMap {

  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => MainHomePage(),
    '/login': (BuildContext context) => LoginPage(),
    '/about': (BuildContext context) => AboutPage(),
    '/sponsor': (BuildContext context) => SponsorPage(),
    '/register': (BuildContext context) => RegisterPage(),


  };


}
