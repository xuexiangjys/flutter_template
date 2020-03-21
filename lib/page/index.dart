import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/click.dart';
import 'package:flutter_template/core/utils/xupdate.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/page/home/tab_home.dart';
import 'package:flutter_template/router/router.dart';

import 'menu/menu_drawer.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        BottomNavigationBarItem(
            title: Text(I18n.of(context).home), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text(I18n.of(context).category), icon: Icon(Icons.list)),
        BottomNavigationBarItem(
            title: Text(I18n.of(context).activity),
            icon: Icon(Icons.local_activity)),
        BottomNavigationBarItem(
            title: Text(I18n.of(context).message),
            icon: Icon(Icons.notifications)),
        BottomNavigationBarItem(
            title: Text(I18n.of(context).profile), icon: Icon(Icons.person)),
      ];

  List<Widget> getTabWidget(BuildContext context) => [
    TabHomePage(),
    Center(child: Text(I18n.of(context).category)),
    Center(child: Text(I18n.of(context).activity)),
    Center(child: Text(I18n.of(context).message)),
    Center(child: Text(I18n.of(context).profile)),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    XUpdate.initAndCheck();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = getTabs(context);
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: tabs[_currentIndex].title,
            actions: <Widget>[
              PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            value: "sponsor",
                            child: Text(I18n.of(context).sponsor)),
                        PopupMenuItem<String>(
                            value: "about",
                            child: Text(I18n.of(context).about)),
                      ],
                  onSelected: (String action) {
                    XRouter.goto(context, '/$action');
                  })
            ],
          ),
          drawer: MenuDrawer(),
          body: IndexedStack(
            index: _currentIndex,
            children: getTabWidget(context),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: tabs,
            //高亮  被点击高亮
            currentIndex: _currentIndex,
            //修改 页面
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            fixedColor: Theme.of(context).primaryColor,
          ),
        ),
        //监听导航栏返回,类似onKeyEvent
        onWillPop: () =>
            ClickUtils.exitBy2Click(status: _scaffoldKey.currentState));
  }
}
