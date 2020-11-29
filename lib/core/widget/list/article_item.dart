import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/router/router.dart';

/// 资讯列表详情
class ArticleListItem extends StatelessWidget {
  //文章地址
  final String articleUrl;

  //图片地址
  final String imageUrl;

  //文章标题
  final String title;

  //文章作者
  final String author;

  //作者描述
  final String description;

  //文章摘要
  final String summary;

  const ArticleListItem(
      {Key key,
      this.articleUrl = '',
      this.imageUrl = '',
      this.title = '这里是标题',
      this.author = '作者',
      this.description = 'xxxx',
      this.summary =
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          XRouter.goWeb(context, articleUrl, title);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  width: 100.0,
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Container(
                              color: Colors.grey[200],
                            ),
                        imageUrl: imageUrl),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      '$author  $description',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            summary,
                            maxLines: 3,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black87),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

class ArticleInfo {
  //文章地址
  final String articleUrl;

  //图片地址
  final String imageUrl;

  //文章标题
  final String title;

  //文章作者
  final String author;

  //作者描述
  final String description;

  //文章摘要
  final String summary;

  const ArticleInfo(this.articleUrl, this.imageUrl, this.title, this.summary,
      {this.author = 'xuexiang', this.description = 'Android架构师'});
}
