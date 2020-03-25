import 'package:flutter/material.dart';
import 'package:flutter_template/page/index.dart';
import 'package:flutter_template/page/menu/about.dart';
import 'package:flutter_template/page/menu/login.dart';
import 'package:flutter_template/page/menu/register.dart';
import 'package:flutter_template/page/menu/settings.dart';
import 'package:flutter_template/page/menu/sponsor.dart';

///页面路由映射表
class RouteMap {

  static final routes = <String, WidgetBuilder>{
    //主页菜单
    '/home': (BuildContext context) => MainHomePage(),
    '/login': (BuildContext context) => LoginPage(),
    '/register': (BuildContext context) => RegisterPage(),
    '/settings': (BuildContext context) => SettingsPage(),
    '/sponsor': (BuildContext context) => SponsorPage(),
    '/about': (BuildContext context) => AboutPage(),


  };


}
