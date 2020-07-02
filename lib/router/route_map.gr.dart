// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/init/splash.dart';
import 'package:flutter_template/router/route_map.dart';
import 'package:flutter_template/page/index.dart';
import 'package:flutter_template/page/menu/login.dart';
import 'package:flutter_template/page/menu/register.dart';
import 'package:flutter_template/page/menu/sponsor.dart';
import 'package:flutter_template/page/menu/settings.dart';
import 'package:flutter_template/page/menu/about.dart';
import 'package:flutter_template/page/menu/theme_color.dart';
import 'package:flutter_template/page/menu/language.dart';

abstract class Routes {
  static const splashPage = '/';
  static const mainHomePage = '/main-home-page';
  static const loginPage = '/login-page';
  static const registerPage = '/register-page';
  static const sponsorPage = '/menu/sponsor-page';
  static const settingsPage = '/menu/settings-page';
  static const aboutPage = '/menu/about-page';
  static const themeColorPage = '/theme-color-page';
  static const languagePage = '/language-page';
  static const all = {
    splashPage,
    mainHomePage,
    loginPage,
    registerPage,
    sponsorPage,
    settingsPage,
    aboutPage,
    themeColorPage,
    languagePage,
  };
}

class RouterMap extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.mainHomePage: [AuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<RouterMap>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => SplashPage(),
          settings: settings,
          transitionsBuilder: getTransitions,
          transitionDuration: const Duration(milliseconds: 800),
        );
      case Routes.mainHomePage:
        if (hasInvalidArgs<MainHomePageArguments>(args)) {
          return misTypedArgsRoute<MainHomePageArguments>(args);
        }
        final typedArgs =
            args as MainHomePageArguments ?? MainHomePageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MainHomePage(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: getTransitions,
          transitionDuration: const Duration(milliseconds: 800),
        );
      case Routes.loginPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          settings: settings,
          transitionsBuilder: getTransitions,
          transitionDuration: const Duration(milliseconds: 800),
        );
      case Routes.registerPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RegisterPage(),
          settings: settings,
          transitionsBuilder: getTransitions,
          transitionDuration: const Duration(milliseconds: 800),
        );
      case Routes.sponsorPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SponsorPage(),
          settings: settings,
        );
      case Routes.settingsPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SettingsPage(),
          settings: settings,
        );
      case Routes.aboutPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => AboutPage(),
          settings: settings,
        );
      case Routes.themeColorPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ThemeColorPage(),
          settings: settings,
          transitionsBuilder: getTransitions,
          transitionDuration: const Duration(milliseconds: 800),
        );
      case Routes.languagePage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LanguagePage(),
          settings: settings,
          transitionsBuilder: getTransitions,
          transitionDuration: const Duration(milliseconds: 800),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//MainHomePage arguments holder class
class MainHomePageArguments {
  final Key key;
  MainHomePageArguments({this.key});
}
