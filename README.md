# flutter_template

Flutter空壳模板工程，已搭建基础框架，实现国际化、主题换肤、登录注册等功能，可在此基础上简单修改实现自己的应用功能。

## 关于我

[![github](https://img.shields.io/badge/GitHub-xuexiangjys-blue.svg)](https://github.com/xuexiangjys)   [![csdn](https://img.shields.io/badge/CSDN-xuexiangjys-green.svg)](http://blog.csdn.net/xuexiangjys)   [![简书](https://img.shields.io/badge/简书-xuexiangjys-red.svg)](https://www.jianshu.com/u/6bf605575337)   [![掘金](https://img.shields.io/badge/掘金-xuexiangjys-brightgreen.svg)](https://juejin.im/user/598feef55188257d592e56ed)   [![知乎](https://img.shields.io/badge/知乎-xuexiangjys-violet.svg)](https://www.zhihu.com/people/xuexiangjys) 


## 效果

![效果](https://github.com/xuexiangjys/Resource/blob/master/img/template/flutter_template.gif)

## 运行

* 查看一下版本号是否正确
```
flutter --version
```

* 运行以下命令查看是否需要安装其它依赖项来完成安装
```
flutter doctor
```

* 运行启动您的应用
```
flutter packages get 
flutter run
```

## 使用方式

1.克隆项目

```
git clone https://github.com/xuexiangjys/flutter_template.git
```

2.修改项目名（文件夹名），并删除目录下的.git文件夹（隐藏文件）

3.使用AS或者VSCode打开项目，然后分别修改flutter、Android、ios项目的包名、应用ID以及应用名等信息。

### Flutter目录修改

* 修改项目根目录`pubspec.yaml`文件, 修改项目名、描述、版本等信息。

![](https://github.com/xuexiangjys/Resource/blob/master/img/template/flutter_1.png)

【注意】这里修改完`pubspec.yaml`中的`name`属性后，flutter项目的包名将会修改，这里我推荐大家使用全局替换的方式修改比较快。例如我想要修改`name`为`flutter_app`,在VSCode中你可以选择`lib`文件夹之后右击，选择`在文件夹中寻找`, 进行全局替换:

![](https://github.com/xuexiangjys/Resource/blob/master/img/template/flutter_2.png)

* 修改`lib/core/http/http.dart`中的网络请求配置，包括：服务器地址、超时、拦截器等设置

* 修改`lib/core/utils/privacy.dart`中隐私服务政策地址

* 修改`lib/core/utils/xupdate.dart`中版本更新检查的地址


### Android目录修改

* 修改android目录下的包名。

在VSCode中你可以选择`android`文件夹之后右击，选择`在文件夹中寻找`, 进行全局替换。

![](https://github.com/xuexiangjys/Resource/blob/master/img/template/android_1.png)

【注意】修改包名之后，记住需要将存放`MainActivity.kt`类的文件夹名也一并修改，否则将会找不到类。

* 修改应用ID。修改`android/app/build.gradle`文件中的`applicationId`

* 修改应用名。修改`android/app/src/main/res/values/strings.xml`文件中的`app_name`

### IOS目录修改

ios修改相对简单，直接使用XCode打开ios目录进行修改即可。如下图所示：

![](https://github.com/xuexiangjys/Resource/blob/master/img/template/ios_1.jpeg)

![](https://github.com/xuexiangjys/Resource/blob/master/img/template/ios_2.png)
