# flutter_template

Flutter空壳模板工程，已搭建基础框架，实现国际化、主题换肤、登录注册等功能，可在此基础上简单修改实现自己的应用功能。

## 关于我

| 公众号   | 掘金     |  知乎    |  CSDN   |   简书   |   思否  |   哔哩哔哩  |   今日头条
|---------|---------|--------- |---------|---------|---------|---------|---------|
| [我的Android开源之旅](https://ss.im5i.com/2021/06/14/6tqAU.png)  |  [点我](https://juejin.im/user/598feef55188257d592e56ed/posts)    |   [点我](https://www.zhihu.com/people/xuexiangjys/posts)       |   [点我](https://xuexiangjys.blog.csdn.net/)  |   [点我](https://www.jianshu.com/u/6bf605575337)  |   [点我](https://segmentfault.com/u/xuexiangjys)  |   [点我](https://space.bilibili.com/483850585)  |   [点我](https://img.rruu.net/image/5ff34ff7b02dd)

## 效果

![flutter_template.gif](https://ss.im5i.com/2021/06/14/62BOO.gif)

## Star趋势图

[![Stargazers over time](https://starchart.cc/xuexiangjys/flutter_template.svg)](https://starchart.cc/xuexiangjys/flutter_template)

## 视频教程

* [Flutter模板工程入门介绍](https://www.bilibili.com/video/BV1854y1W7hB)

* [Flutter模板工程使用详解](https://www.bilibili.com/video/BV13N411d73X)

* [Flutter系列视频教程](https://space.bilibili.com/483850585/channel/detail?cid=168279)

## 运行

* 查看一下版本号是否正确, 要求flutter的版本是`2.x.x`的版本。

```
flutter --version
```
**【注意】** 如果你的flutter版本是`1.x.x`版本，那么请将你的flutter版本进行升级，或者使用`flutter/1.0`的分支。

* 运行以下命令查看是否需要安装其它依赖项来完成安装
```
flutter doctor
```

* 运行启动您的应用
```
flutter packages get 
flutter run
```

## 项目集成介绍

> 本项目精选了目前Flutter最实用的几个库，可大大提高开发的效率。

* [flutter_i18n(国际化插件)](https://marketplace.visualstudio.com/items?itemName=esskar.vscode-flutter-i18n-json)
* [GetX(路由、状态管理工具)](https://pub.dev/packages/get)
* [cached_network_image (网络缓存图片)](https://pub.dev/packages/cached_network_image)
* [dio (非常好用的网络请求库)](https://pub.dev/packages/dio)
* [event_bus (事件工具)](https://pub.dev/packages/event_bus)
* [flutter_easyrefresh (刷新组件)](https://pub.dev/packages/flutter_easyrefresh)
* [flutter_webview_plugin (网页加载)](https://pub.dev/packages/flutter_webview_plugin)
* [flutter_spinkit (loading加载动画)](https://pub.dev/packages/flutter_spinkit)
* [flutter_swiper (轮播图组件)](https://pub.dev/packages/flutter_swiper)
* [flutter_xupdate (应用版本更新)](https://pub.dev/packages/flutter_xupdate)
* [oktoast](https://pub.dev/packages/oktoast)
* [path_provider (路径)](https://pub.dev/packages/path_provider)
* [package_info (应用包信息)](https://pub.dev/packages/url_launcher)
* [permission_handler 权限申请](https://pub.dev/packages/permission_handler)
* [provider (非常好用的数据共享工具)](https://pub.dev/packages/provider)
* [share (分享)](https://pub.dev/packages/share)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [url_launcher (链接处理)](https://pub.dev/packages/url_launcher)

## 使用指南

1.克隆项目

```
git clone https://github.com/xuexiangjys/flutter_template.git
```

2.修改项目名（文件夹名），并删除目录下的.git文件夹（隐藏文件）

3.使用AS或者VSCode打开项目，然后分别修改flutter、Android、ios项目的包名、应用ID以及应用名等信息。

最简单的替换方法就是进行全局替换,搜索关键字`flutter_template`,然后替换你想要的项目包名,如下图所示:

![flutter_replace.png](https://ss.im5i.com/2021/06/14/69tpS.png)

### Flutter目录修改

* 修改项目根目录`pubspec.yaml`文件, 修改项目名、描述、版本等信息。

![flutter_1.png](https://ss.im5i.com/2021/06/14/62gXL.png)

【注意】这里修改完`pubspec.yaml`中的`name`属性后，flutter项目的包名将会修改，这里我推荐大家使用全局替换的方式修改比较快。例如我想要修改`name`为`flutter_app`,在VSCode中你可以选择`lib`文件夹之后右击，选择`在文件夹中寻找`, 进行全局替换:

![flutter_2.png](https://ss.im5i.com/2021/06/14/62Vum.png)

* 修改`lib/core/http/http.dart`中的网络请求配置，包括：服务器地址、超时、拦截器等设置

* 修改`lib/core/utils/privacy.dart`中隐私服务政策地址

* 修改`lib/core/utils/xupdate.dart`中版本更新检查的地址


### Android目录修改

* 修改android目录下的包名。

在VSCode中你可以选择`android`文件夹之后右击，选择`在文件夹中寻找`, 进行全局替换。

![android_1.png](https://ss.im5i.com/2021/06/14/62GDt.png)

【注意】修改包名之后，记住需要将存放`MainActivity.kt`类的文件夹名也一并修改，否则将会找不到类。

* 修改应用ID。修改`android/app/build.gradle`文件中的`applicationId`

* 修改应用名。修改`android/app/src/main/res/values/strings.xml`文件中的`app_name`

### IOS目录修改

ios修改相对简单，直接使用XCode打开ios目录进行修改即可。如下图所示：

![ios_1.jpeg](https://ss.im5i.com/2021/06/14/69UrD.jpg)

![ios_2.png](https://ss.im5i.com/2021/06/14/69bRj.png)


## 更新插件版本

```
flutter packages upgrade
flutter pub outdated
flutter pub upgrade --major-versions
```

---

## 如果觉得项目还不错，可以考虑打赏一波

> 你的打赏是我维护的动力，我将会列出所有打赏人员的清单在下方作为凭证，打赏前请留下打赏项目的备注！

![pay.png](https://ss.im5i.com/2021/06/14/6twG6.png)

## 微信公众号

> 更多资讯内容，欢迎扫描关注我的个人微信公众号:【我的Android开源之旅】

![gzh_weixin.jpg](https://ss.im5i.com/2021/06/14/65yoL.jpg)

