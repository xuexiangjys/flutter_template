import 'dart:io';

import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';

///版本更新工具
class XUpdate {
  XUpdate._internal();

  ///版本更新检查的地址
  static const String UPDATE_URL = "";

  static void initAndCheck() {
    if (Platform.isAndroid) {
      init(url: UPDATE_URL);
    }
  }

  ///初始化XUpdate
  static void init({String url = ""}) {
    FlutterXUpdate.init(
            debug: true,
            enableRetry: true,
            retryContent: "Github下载速度太慢了，是否考虑切换蒲公英下载？",
            retryUrl: "https://www.pgyer.com/flutter_learn")
        .then((_result) {
      if (url.isNotEmpty) {
        checkUpdate(url);
      }
    });
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic> message) async {
      ///2004是无最新版本
      if (message['code'] != 2004) {
        ///4000是下载失败
        if (message['code'] == 4000) {
          FlutterXUpdate.showRetryUpdateTipDialog(
              retryContent: "Github被墙无法继续下载，是否考虑切换蒲公英下载？",
              retryUrl: "https://www.pgyer.com/flutter_learn");
        } else {
          ToastUtils.error(message['detailMsg']);
        }
      }
    });
  }

  ///初始化XUpdate
  static void checkUpdate(String url) {
    if (url != null && url.isNotEmpty) {
      FlutterXUpdate.checkUpdate(url: url, widthRatio: 0.7);
    }
  }

  ///初始化XUpdate
  static void checkUpdateWithErrorTip({String url = UPDATE_URL}) {
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic> message) async {
      ///4000是下载失败
      if (message['code'] == 4000) {
        FlutterXUpdate.showRetryUpdateTipDialog(
            retryContent: "Github被墙无法继续下载，是否考虑切换蒲公英下载？",
            retryUrl: "https://www.pgyer.com/flutter_learn");
      } else {
        ToastUtils.error(message['message']);
      }
    });
    checkUpdate(url);
  }
}
