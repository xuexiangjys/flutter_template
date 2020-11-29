// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../init/splash.dart';
import '../page/index.dart';
import '../page/menu/about.dart';
import '../page/menu/language.dart';
import '../page/menu/login.dart';
import '../page/menu/register.dart';
import '../page/menu/settings.dart';
import '../page/menu/sponsor.dart';
import '../page/menu/theme_color.dart';
import 'route_map.dart';

class Routes {
  static const String splashPage = '/';
  static const String mainHomePage = '/main-home-page';
  static const String sponsorPage = '/menu/sponsor-page';
  static const String settingsPage = '/menu/settings-page';
  static const String aboutPage = '/menu/about-page';
  static const String loginPage = '/login-page';
  static const String registerPage = '/register-page';
  static const String themeColorPage = '/theme-color-page';
  static const String languagePage = '/language-page';
  static const all = <String>{
    splashPage,
    mainHomePage,
    sponsorPage,
    settingsPage,
    aboutPage,
    loginPage,
    registerPage,
    themeColorPage,
    languagePage,
  };
}

class RouterMap extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.mainHomePage, page: MainHomePage, guards: [AuthGuard]),
    RouteDef(Routes.sponsorPage, page: SponsorPage),
    RouteDef(Routes.settingsPage, page: SettingsPage),
    RouteDef(Routes.aboutPage, page: AboutPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.registerPage, page: RegisterPage),
    RouteDef(Routes.themeColorPage, page: ThemeColorPage),
    RouteDef(Routes.languagePage, page: LanguagePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SplashPage(),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: getTransitions,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    MainHomePage: (data) {
      final args = data.getArgs<MainHomePageArguments>(
        orElse: () => MainHomePageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MainHomePage(key: args.key),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: getTransitions,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    SponsorPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SponsorPage(),
        settings: data,
      );
    },
    SettingsPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
        settings: data,
      );
    },
    AboutPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AboutPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoginPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: getTransitions,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    RegisterPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: getTransitions,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    ThemeColorPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ThemeColorPage(),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: getTransitions,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    LanguagePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LanguagePage(),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: getTransitions,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MainHomePage arguments holder class
class MainHomePageArguments {
  final Key key;
  MainHomePageArguments({this.key});
}
