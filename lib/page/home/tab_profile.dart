/*
 * @Author: Nathaniel
 * @Date: 2021-03-25 14:48:02
 */
import 'package:flutter/material.dart';
import 'package:flutter_template/core/http/http.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/model/project.dart';
import 'package:flutter_template/utils/req_method.dart';

class TabProfile extends StatefulWidget {
  @override
  _TabProfileState createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  List<Project> projectList = List.empty();
  int passage = 1;
  int counter = 5;

  @override
  void initState() {
    super.initState();
    requestServer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(I18n.of(context).profile));
  }

  void requestServer() {
    XHttp.request<Project>(ReqMethod.GET, "project/tree/json",
        success: (listEntity) {
      print("success data = $listEntity");
    }, failure: (errorEntity) {
      print(
          "failure: code = ${errorEntity.code}, message=${errorEntity.message}");
    });
  }
}
