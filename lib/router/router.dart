import 'package:auto_route/auto_route.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/widget/web_view_page.dart';
import 'package:flutter_template/router/route_map.gr.dart';

///使用fluro进行路由管理
class XRouter {
  static Router router;

  static void init() {
    router = Router();
    configureRoutes(router);
  }

  ///路由配置
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return null;
    });

    //网页加载
    router.define('/web', handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(url, title);
    }));
  }

  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<RouterMap>();
}
