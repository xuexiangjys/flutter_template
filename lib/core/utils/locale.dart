

import 'dart:ui';

import 'package:devicelocale/devicelocale.dart';

class LocaleUtils {

  static Future<Locale> getSystemLocale() async {
    String locale = await Devicelocale.currentLocale;
    var array = locale.split("_");
    if (array.length > 1) {
      return Locale(array[0], array[1]);
    }
    return null;
  }

}