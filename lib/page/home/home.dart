import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/click.dart';
import 'package:flutter_template/core/utils/xupdate.dart';
import 'package:flutter_template/generated/i18n.dart';

import 'home_drawer.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        BottomNavigationBarItem(title: Text("主页"), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text("列表"), icon: Icon(Icons.list)),
        BottomNavigationBarItem(title: Text("新建"), icon: Icon(Icons.add)),
        BottomNavigationBarItem(title: Text("消息"), icon: Icon(Icons.message)),
        BottomNavigationBarItem(title: Text("菜单"), icon: Icon(Icons.menu)),
        BottomNavigationBarItem(
            title: Text("其他"), icon: Icon(Icons.devices_other)),
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
            title: Text(I18n.of(context).title),
          ),
          drawer: HomeDrawer(),
          body: IndexedStack(
            index: _currentIndex,
            children: tabs.map((BottomNavigationBarItem tab) {
              return Center(child: tab.title);
            }).toList(),
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
