import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/router/router.dart';
import 'utils.dart';

//隐私弹窗工具
class PrivacyUtils {
  PrivacyUtils._internal();

  //隐私服务政策地址
  static const PRIVACY_URL =
      'https://gitee.com/xuexiangjys/flutter_template/raw/master/LICENSE';

  static void showPrivacyDialog(BuildContext context,
      {VoidCallback onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(I18n.of(context).reminder),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(I18n.of(context).welcome(packageInfo.appName)),
                  SizedBox(height: 5),
                  Text(I18n.of(context).welcome1),
                  SizedBox(height: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: I18n.of(context).welcome2),
                    TextSpan(
                        text: I18n.of(context).privacyName(packageInfo.appName),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            XRouter.goWeb(
                                context,
                                PRIVACY_URL,
                                I18n.of(context)
                                    .privacyName(packageInfo.appName));
                          }),
                    TextSpan(text: I18n.of(context).welcome3),
                  ])),
                  SizedBox(height: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: I18n.of(context).welcome4),
                    TextSpan(
                        text: I18n.of(context).privacyName(packageInfo.appName),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            XRouter.goWeb(
                                context,
                                PRIVACY_URL,
                                I18n.of(context)
                                    .privacyName(packageInfo.appName));
                          }),
                    TextSpan(text: I18n.of(context).welcome5),
                  ])),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(I18n.of(context).disagree),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacySecond(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
              FlatButton(
                child: Text(I18n.of(context).agree),
                onPressed: onAgressCallback == null
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : onAgressCallback,
              ),
            ],
          );
        },
      );
    });
  }

  ///第二次提醒
  static void showPrivacySecond(BuildContext context,
      {VoidCallback onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(I18n.of(context).reminder),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(I18n.of(context)
                      .privacyExplainAgain(packageInfo.appName)),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(I18n.of(context).stillDisagree),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyThird(context, onAgressCallback: onAgressCallback);
                },
              ),
              FlatButton(
                child: Text(I18n.of(context).lookAgain),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
            ],
          );
        },
      );
    });
  }

  ///第三次提醒
  static void showPrivacyThird(BuildContext context,
      {VoidCallback onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(I18n.of(context).thinkAboutItAgain),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(I18n.of(context).exitApp),
                onPressed: () {
                  //退出程序
                  // SystemNavigator.pop();
                  exit(0);
                },
              ),
              FlatButton(
                child: Text(I18n.of(context).lookAgain),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
            ],
          );
        },
      );
    });
  }
}
