import 'package:flutter/material.dart';
import 'package:flutter_template/utils/sputils.dart';
import 'package:get/get.dart';

//类似广告启动页
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(child: FlutterLogo(size: 96)));
  }

  //倒计时
  void countDown() {
    var _duration = Duration(seconds: 2);
    new Future.delayed(_duration, goHomePage);
  }

  //页面跳转
  void goHomePage() {
    Get.offNamed(SPUtils.isLogined() ? '/home' : '/login');
  }
}
