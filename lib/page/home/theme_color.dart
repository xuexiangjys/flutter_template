import 'package:flutter/material.dart';
import 'package:flutter_template/generated/i18n.dart';
import 'package:flutter_template/utils/provider.dart';

class ThemeColorPage extends StatefulWidget {
  @override
  _ThemeColorPageState createState() => _ThemeColorPageState();
}

class _ThemeColorPageState extends State<ThemeColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I18n.of(context).theme)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: AppTheme.materialColors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 10.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Store.value<AppTheme>(context).changeColor(index);
            },
            child: Container(color: AppTheme.materialColors[index]),
          );
        },
      ),
    );
  }
}
