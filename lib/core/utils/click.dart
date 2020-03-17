import 'package:flutter/material.dart';
import 'toast.dart';

class ClickUtils {
  ClickUtils._internal();

  static DateTime _lastPressedAt; //上次点击时间

  //双击返回
  static Future<bool> exitBy2Click(
      {int duration = 1000, ScaffoldState status}) async {
    if (status != null && status.isDrawerOpen) {
      return Future.value(true);
    }

    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) >
            Duration(milliseconds: duration)) {
      //两次点击间隔超过1秒则重新计时
      ToastUtils.toast("再按一次退出程序");
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
