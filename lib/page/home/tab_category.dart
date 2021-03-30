/*
 * @Author: Nathaniel
 * @Date: 2021-03-25 14:48:02
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_template/core/http/http.dart';
import 'package:flutter_template/core/widget/list/item_project.dart';
import 'package:flutter_template/model/project.dart';
import 'package:flutter_template/utils/req_method.dart';

class TabCategory extends StatefulWidget {
  @override
  _TabCategoryState createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory> {
  List<Project> projectList = List();
  int passage = 1;
  int counter = 5;

  @override
  void initState() {
    super.initState();
    requestServer();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text(I18n.of(context).category));
    return EasyRefresh.custom(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            counter = 5;
          });
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            counter += 5;
          });
        });
      },
      slivers: <Widget>[
        //=====列表=====//
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Project project = projectList[index % 5];
              return ItemListProject();
            },
            childCount: counter,
          ),
        ),
      ],
    );
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
