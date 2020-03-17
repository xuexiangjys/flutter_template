import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static SharedPreferences _spf;

  static Future<SharedPreferences> init() async {
    if (_spf == null) {
      _spf = await SharedPreferences.getInstance();
    }
    return _spf;
  }

  ///主题
  static Future<bool> saveThemeIndex(int value) {
    return _spf.setInt('key_theme_color', value);
  }

  static int getThemeIndex() {
    if (_spf.containsKey('key_theme_color')) {
      return _spf.getInt('key_theme_color');
    }
    return 0;
  }

  ///语言
  static Future<bool> saveLocale(String locale) {
    return _spf.setString('key_locale', locale);
  }

  static String getLocale() {
    return _spf.getString('key_locale');
  }

  ///昵称
  static Future<bool> saveNickName(String nickName) {
    return _spf.setString('key_nickname', nickName);
  }

  static String getNickName() {
    return _spf.getString('key_nickname');
  }

}
