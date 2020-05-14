import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_template/core/utils/utils.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';

class SponsorPage extends StatefulWidget {
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(I18n.of(context).sponsor)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Text(I18n.of(context).sponsorDescription,
                  style: TextStyle(color: Colors.grey[700], fontSize: 15)),
              SizedBox(height: 15),
              _loadImage(
                  "https://gitee.com/xuexiangjys/Resource/raw/master/img/pay/alipay.jpeg",
                  linkUrl: "https://qr.alipay.com/fkx14433o4e5gqkhi9fsr2f"),
              SizedBox(height: 15),
              _loadImage(
                  "https://gitee.com/xuexiangjys/Resource/raw/master/img/pay/weixinpay.jpeg"),
            ])));
  }

  Widget _loadImage(String url, {String linkUrl = ''}) => SizedBox(
        width: 166,
        height: 249,
        child: Center(
            child: GestureDetector(
          child: ExtendedImage.network(
            url,
          ),
          onLongPress: () => showMenuDialog(url, linkUrl),
        )),
      );

  ///显示操作菜单弹窗
  void showMenuDialog(String url, String linkUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          titlePadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          title: Text('操作'),
          children: <Widget>[
            linkUrl.isNotEmpty
                ? SimpleDialogOption(
                    child: Text('打开应用'),
                    onPressed: () {
                      Utils.launchURL(linkUrl);
                      Navigator.of(context).pop();
                    },
                  )
                : SizedBox(),
            SimpleDialogOption(
              child: Text('保存到本地'),
              onPressed: () {
                saveImage(url);
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('分享给好友'),
              onPressed: () {
                shareImage(url);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ///保存网络图片
  void saveImage(String url) {
    Permission.storage.request().then((value) {
      if (PermissionStatus.granted == value) {
        saveNetworkImageToPhoto(url).then((value) {
          if (value != null && value.isNotEmpty) {
            ToastUtils.success("图片保存成功: $value");
          } else {
            ToastUtils.error("图片保存失败!");
          }
        }).catchError((onError) {
          ToastUtils.error("图片保存失败:$onError");
        });
      } else {
        ToastUtils.error("权限申请失败!");
      }
    });
  }

  Future<String> saveNetworkImageToPhoto(String url,
      {bool useCache: true}) async {
    var data = await getNetworkImageData(url, useCache: useCache);
    return await ImagePickerSaver.saveFile(fileData: data);
  }

  void shareImage(String url) {
    Share.share(url);
  }
}
