import 'package:flutter/material.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:provider/provider.dart';

import 'sputils.dart';

//状态管理
class Store {
  Store._internal();

  //全局初始化
  static init(Widget child) {
    //多个Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppTheme(getDefaultTheme())),
        ChangeNotifierProvider.value(value: LocaleModel(SPUtils.getLocale())),
        ChangeNotifierProvider.value(value: UserProfile(SPUtils.getNickName())),
        ChangeNotifierProvider.value(value: AppStatus(TAB_HOME_INDEX)),
      ],
      child: child,
    );
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T value<T>(BuildContext context, {bool listen = false}) {
    return Provider.of<T>(context, listen: listen);
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T of<T>(BuildContext context, {bool listen = true}) {
    return Provider.of<T>(context, listen: listen);
  }

  // 不会引起页面的刷新，只刷新了 Consumer 的部分，极大地缩小你的控件刷新范围
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}

MaterialColor getDefaultTheme() {
  return AppTheme.materialColors[SPUtils.getThemeIndex()];
}

///主题
class AppTheme with ChangeNotifier {
  static final List<MaterialColor> materialColors = [
    Colors.blue,
    Colors.lightBlue,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.grey,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.lime
  ];

  MaterialColor _themeColor;

  AppTheme(this._themeColor);

  void setColor(MaterialColor color) {
    _themeColor = color;
    notifyListeners();
  }

  void changeColor(int index) {
    _themeColor = materialColors[index];
    SPUtils.saveThemeIndex(index);
    notifyListeners();
  }

  get themeColor => _themeColor;
}

///语言
class LocaleModel with ChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if (_locale == null) return null;
    var t = _locale.split("_");
    return Locale(t[0], t[1]);
  }

  String _locale;

  LocaleModel(this._locale);

  // 获取当前Locale的字符串表示
  String get locale => _locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (_locale != locale) {
      _locale = locale;
      I18n.locale = getLocale();
      SPUtils.saveLocale(_locale);
      notifyListeners();
    }
  }
}

///用户账户信息
class UserProfile with ChangeNotifier {
  String _nickName;

  UserProfile(this._nickName);

  String get nickName => _nickName;

  set nickName(String nickName) {
    _nickName = nickName;
    SPUtils.saveNickName(nickName);
    notifyListeners();
  }
}

///主页
const int TAB_HOME_INDEX = 0;
///分类
const int TAB_CATEGORY_INDEX = 1;
///活动
const int TAB_ACTIVITY_INDEX = 2;
///消息
const int TAB_MESSAGE_INDEX = 3;
///我的
const int TAB_PROFILE_INDEX = 4;

///应用状态
class AppStatus with ChangeNotifier {
  
  //主页tab的索引
  int _tabIndex;

  AppStatus(this._tabIndex);

  int get tabIndex => _tabIndex;

  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}

