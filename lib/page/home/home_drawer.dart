import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_template/core/utils/xuifont.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/router/router.dart';
import 'package:flutter_template/utils/provider.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'language.dart';
import 'sponsor.dart';
import 'theme_color.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfile>(
        builder: (BuildContext context, UserProfile value, Widget child) {
      return Drawer(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                        child: FlutterLogo(
                          size: 80,
                        ),
                      ),
                    ),
                    Text(
                      value.nickName != null
                          ? value.nickName
                          : I18n.of(context).title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                ToastUtils.toast("点击头像");
              },
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: ListView(
                shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                scrollDirection: Axis.vertical, // 水平listView
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.color_lens),
                    title: Text(I18n.of(context).theme),
                    onTap: () {
                      XRouter.gotoWidget(context, ThemeColorPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(I18n.of(context).language),
                    onTap: () {
                      XRouter.gotoWidget(context, LanguagePage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(I18n.of(context).sponsor),
                    onTap: () {
                      XRouter.gotoWidget(context, SponsorPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.error_outline),
                    title: Text(I18n.of(context).about),
                    onTap: () {
                      XRouter.gotoWidget(context, AboutPage());
                    },
                  ),
                  Divider(height: 1.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(XUIIcons.logout),
                    title: Text(I18n.of(context).logout),
                    onTap: () {
                      value.nickName = null;
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
