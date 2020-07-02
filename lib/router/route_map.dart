import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/init/splash.dart';
import 'package:flutter_template/page/index.dart';
import 'package:flutter_template/page/menu/about.dart';
import 'package:flutter_template/page/menu/language.dart';
import 'package:flutter_template/page/menu/login.dart';
import 'package:flutter_template/page/menu/register.dart';
import 'package:flutter_template/page/menu/settings.dart';
import 'package:flutter_template/page/menu/sponsor.dart';
import 'package:flutter_template/page/menu/theme_color.dart';
import 'package:flutter_template/router/route_map.gr.dart';
import 'package:flutter_template/utils/sputils.dart';

///页面路由映射表
@CustomAutoRouter(
    routesClassName: 'Routes',
    transitionsBuilder: getTransitions,
    durationInMilliseconds: 800)
class $RouterMap {
  @initial
  SplashPage splashPage;

  @GuardedBy([AuthGuard])
  MainHomePage mainHomePage;

  LoginPage loginPage;
  RegisterPage registerPage;

  @CustomRoute(name: '/menu/sponsor-page')
  SponsorPage sponsorPage;
  @CustomRoute(name: '/menu/settings-page')
  SettingsPage settingsPage;
  @CustomRoute(name: '/menu/about-page')
  AboutPage aboutPage;

  ThemeColorPage themeColorPage;
  LanguagePage languagePage;
}

/// 认证处理
class AuthGuard extends RouteGuard {
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    if (SPUtils.isLogined()) {
      return true;
    }
    navigator.pushReplacementNamed(Routes.loginPage);
    return false;
  }
}

/// 页面切换动画
Widget getTransitions(BuildContext context, Animation<double> animation1,
    Animation<double> animation2, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
            //1.0为右进右出，-1.0为左进左出
            begin: Offset(1.0, 0.0),
            end: Offset(0.0, 0.0))
        .animate(
            CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
    child: child,
  );
}
