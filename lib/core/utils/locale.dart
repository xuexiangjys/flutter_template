import 'dart:ui';

import 'package:devicelocale/devicelocale.dart';

class LocaleUtils {

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  LocaleUtils._internal();

  static Locale _systemLocale;

  static Future<void> init() async {
    _systemLocale = await getSystemLocaleAsync();
  }

  static Locale getSystemLocale() {
    return _systemLocale;
  }

  static Future<Locale> getSystemLocaleAsync() async {
    String locale = await Devicelocale.currentLocale;
    var array = locale.split("_");
    if (array.length > 1) {
      return Locale(array[0], array[1]);
    }
    return null;
  }
}
