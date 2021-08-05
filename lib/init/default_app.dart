import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/http/http.dart';
import 'package:flutter_template/core/utils/locale.dart';
import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/router/route_map.dart';
import 'package:flutter_template/utils/provider.dart';
import 'package:flutter_template/utils/sputils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    initFirst().then((value) => runApp(Store.init(ToastUtils.init(MyApp()))));
    initApp();
  }

  /// 必须要优先初始化的内容
  static Future<void> initFirst() async {
    await SPUtils.init();
    await LocaleUtils.init();
  }

  /// 程序初始化操作
  static void initApp() {
    XHttp.init();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppTheme, LocaleModel>(
        builder: (context, appTheme, localeModel, _) {
      return GetMaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          brightness: appTheme.brightness,
          primarySwatch: appTheme.themeColor,
          buttonColor: appTheme.themeColor,
        ),
        getPages: RouteMap.getPages,
        defaultTransition: Transition.rightToLeft,
        locale: localeModel.getLocale(),
        supportedLocales: I18n.delegate.supportedLocales,
        localizationsDelegates: [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback:
            (Locale _locale, Iterable<Locale> supportedLocales) {
          if (localeModel.getLocale() != null) {
            //如果已经选定语言，则不跟随系统
            return localeModel.getLocale();
          } else {
            //跟随系统
            Locale systemLocale = LocaleUtils.getSystemLocale();
            if (I18n.delegate.isSupported(systemLocale)) {
              return systemLocale;
            }
            return supportedLocales.first;
          }
        },
      );
    });
  }
}
