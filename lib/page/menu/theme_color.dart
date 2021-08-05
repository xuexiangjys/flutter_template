import 'package:flutter/material.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/utils/provider.dart';
import 'package:provider/provider.dart';

class ThemeColorPage extends StatefulWidget {
  @override
  _ThemeColorPageState createState() => _ThemeColorPageState();
}

class _ThemeColorPageState extends State<ThemeColorPage> {
  bool _isDark;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    _isDark = appTheme.brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(title: Text(I18n.of(context).theme)),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              sliver: SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return ListTile(
                    title: Text(
                      I18n.of(context).darkTheme,
                      style: TextStyle(
                          color: _isDark
                              ? Colors.white
                              : Theme.of(context).primaryColor),
                    ),
                    trailing: Switch(
                      value: _isDark,
                      onChanged: (value) {
                        Store.value<AppTheme>(context).changeBrightness(value);
                      },
                    ),
                  );
                }, childCount: 1),
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        //创建子widget
                        return GestureDetector(
                          onTap: () {
                            Store.value<AppTheme>(context).changeColor(index);
                          },
                          child:
                              Container(color: AppTheme.materialColors[index]),
                        );
                      },
                      childCount: AppTheme.materialColors.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //横轴元素个数
                        crossAxisCount: 3,
                        //纵轴间距
                        mainAxisSpacing: 10.0,
                        //横轴间距
                        crossAxisSpacing: 10.0,
                        //子组件宽高长度比例
                        childAspectRatio: 1.0)))
          ],
        ));
  }
}
