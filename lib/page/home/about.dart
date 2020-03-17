import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/utils.dart';
import 'package:flutter_template/core/utils/xupdate.dart';
import 'package:flutter_template/core/widget/list/list_item.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _versionName = '';

  @override
  void initState() {
    super.initState();
    Utils.getPackageInfo().then((value) => {
          setState(() {
            _versionName = value.version;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(I18n.of(context).about)),
        body: Container(
            color: Colors.white,
            child: ListView(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: FlutterLogo(
                    size: 80,
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Center(
                      child: Text(
                          "${I18n.of(context).versionName}: $_versionName",
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 17)))),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          ListItem(
                            icon: Icon(
                              Icons.assignment_ind,
                              color: Colors.white,
                            ),
                            title: I18n.of(context).author,
                            titleColor: Colors.white,
                            describe: 'xuexiangjys',
                            describeColor: Colors.white,
                            onPressed: () {
                              launch('https://github.com/xuexiangjys');
                            },
                          ),
                          ListItem(
                            icon: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                            ),
                            title: I18n.of(context).qqgroup,
                            titleColor: Colors.white,
                            describe: '602082750',
                            describeColor: Colors.white,
                            onPressed: () {
                              launch(
                                  'http://qm.qq.com/cgi-bin/qm/qr?k=tiP-E6rDf0y77PRNfp2lNVcc9RsglPCM');
                            },
                          ),
                          ListItem(
                            icon: Icon(
                              Icons.http,
                              color: Colors.white,
                            ),
                            title: "Github",
                            titleColor: Colors.white,
                            describe:
                                'https://github.com/xuexiangjys/flutter_template',
                            describeColor: Colors.white,
                            onPressed: () {
                              launch(
                                  'https://github.com/xuexiangjys/flutter_template');
                            },
                          ),
                          ListItem(
                            icon: Icon(
                              Icons.update,
                              color: Colors.white,
                            ),
                            title: I18n.of(context).appupdate,
                            titleColor: Colors.white,
                            describeColor: Colors.white,
                            onPressed: () {
                              XUpdate.checkUpdateWithErrorTip();
                            },
                          )
                        ],
                      ),
                    )),
              ),
            ])));
  }
}
