import 'package:flutter/material.dart';

/// 列表项
class GridItem extends StatelessWidget {
  // 文字
  final String title;
  // 颜色
  final Color color;
  //是否可点击
  final bool enabled;
  //点击事件
  final GestureTapCallback onTap;

  // 构造函数
  const GridItem(
      {Key key, this.title, this.color, this.enabled = true, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: enabled ? onTap : null,
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Column(children: <Widget>[
            ClipOval(
              child: Container(
                alignment: Alignment.center,
                color: color,
                child: Text(title.substring(0, 1),
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                width: 40,
                height: 40,
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10), child: Text(title, style: TextStyle(fontSize: 14)))
          ]),
        ));
  }
}

class ActionItem {
  final String title;
  final Color color;
  const ActionItem(this.title, this.color);
}
