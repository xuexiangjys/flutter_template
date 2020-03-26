import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_template/core/widget/grid/grid_item.dart';
import 'package:flutter_template/core/widget/list/article_item.dart';

class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  int _count = 5;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _count = 5;
          });
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _count += 5;
          });
        });
      },
      slivers: <Widget>[
        //=====轮播图=====//
        SliverToBoxAdapter(child: getBannerWidget()),

        //=====网格菜单=====//
        SliverPadding(
            padding: EdgeInsets.only(top: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  var action = actions[index];
                  return GridItem(
                      title: action.title,
                      color: action.color,
                      onTap: () {
                        ToastUtils.toast('点击-->${action.title}');
                      });
                },
                childCount: actions.length,
              ),
            )),

        SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Text(
                  '资讯',
                  style: TextStyle(fontSize: 18),
                ))),

        //=====列表=====//
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              ArticleInfo info = articles[index % 5];
              return ArticleListItem(
                  articleUrl: info.articleUrl,
                  imageUrl: info.imageUrl,
                  title: info.title,
                  author: info.author,
                  description: info.description,
                  summary: info.summary);
            },
            childCount: _count,
          ),
        ),
      ],
    );
  }

  //这里是演示，所以写死
  final List<String> urls = [
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144160323071011277.jpg", //伪装者:胡歌演绎"痞子特工"
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144158380433341332.jpg", //无心法师:生死离别!月牙遭虐杀
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144160286644953923.jpg", //花千骨:尊上沦为花千骨
    "http://photocdn.sohu.com/tvmobilemvms/20150902/144115156939164801.jpg", //综艺饭:胖轩偷看夏天洗澡掀波澜
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144159406950245847.jpg", //碟中谍4:阿汤哥高塔命悬一线,超越不可能
  ];

  Widget getBannerWidget() {
    return SizedBox(
      height: 200,
      child: Swiper(
        autoplay: true,
        duration: 2000,
        autoplayDelay: 5000,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                    urls[index],
                  ),
                )),
          );
        },
        onTap: (value) {
          ToastUtils.toast("点击--->" + value.toString());
        },
        itemCount: urls.length,
        pagination: SwiperPagination(),
      ),
    );
  }

  //这里是演示，所以写死
  final List<ActionItem> actions = [
    ActionItem('美食', Color(0xFFEF5362)),
    ActionItem('甜点', Color(0xFFFE6D4B)),
    ActionItem('烧烤', Color(0xFFFFCF47)),
    ActionItem('夜宵', Color(0xFF9FD661)),
    ActionItem('水果', Color(0xFF3FD0AD)),
    ActionItem('药品', Color(0xFF2BBDF3)),
    ActionItem('蔬菜', Color(0xFF5A9AEF)),
    ActionItem('跑腿', Color(0xFFAC8FEF)),
  ];

  //这里是演示，所以写死
  final List<ArticleInfo> articles = [
    ArticleInfo(
        'https://juejin.im/post/5c3ed1dae51d4543805ea48d',
        'https://user-gold-cdn.xitu.io/2019/1/16/1685563ae5456408?imageView2/0/w/1280/h/960/format/webp/ignore-error/1',
        'XUI 一个简洁而优雅的Android原生UI框架，解放你的双手',
        '涵盖绝大部分的UI组件：TextView、Button、EditText、ImageView、Spinner、Picker、Dialog、PopupWindow、ProgressBar、LoadingView、StateLayout、FlowLayout、Switch、Actionbar、TabBar、Banner、GuideView、BadgeView、MarqueeView、WebView、SearchView等一系列的组件和丰富多彩的样式主题。'),
    ArticleInfo(
        'https://juejin.im/post/5b480b79e51d45190905ef44',
        'https://user-gold-cdn.xitu.io/2018/7/13/16492d9b7877dc21?imageView2/0/w/1280/h/960/format/webp/ignore-error/11',
        'XUpdate 一个轻量级、高可用性的Android版本更新框架',
        'XUpdate 一个轻量级、高可用性的Android版本更新框架。本框架借鉴了AppUpdate中的部分思想和UI界面，将版本更新中的各部分环节抽离出来，形成了如下几个部分：'),
    ArticleInfo(
        'https://juejin.im/post/5b480b79e51d45190905ef44',
        'https://user-gold-cdn.xitu.io/2018/8/9/1651c568a7e30e02?imageView2/0/w/1280/h/960/format/webp/ignore-error/1',
        'XHttp2 一个功能强悍的网络请求库，使用RxJava2 + Retrofit2 + OKHttp进行组装',
        '一个功能强悍的网络请求库，使用RxJava2 + Retrofit2 + OKHttp组合进行封装。还不赶紧点击使用说明文档，体验一下吧！'),
    ArticleInfo(
        'https://juejin.im/post/5d431825e51d45620611599a',
        'https://user-gold-cdn.xitu.io/2019/8/2/16c4e164ec90978f?imageslim',
        '你真的会使用github吗？',
        'github作为全球最大的开源软件托管平台，自2008年上线以来，一直吸引了无数的程序开发者在上面开源分享自己的项目代码。尤其是在微软收购github之后，更是吸引了很多非程序开发者将自己的知识和经验通过平台分享出来，可以说github是一个蕴藏了无数价值和宝藏的大宝库。然而，对于这样一个极具价值的平台，你真的会使用吗？'),
    ArticleInfo(
        'https://juejin.im/post/5e39a1b8518825497467e4ec',
        'https://pic4.zhimg.com/v2-1236d741cbb3aabf5a9910a5e4b73e4c_1200x500.jpg',
        'Flutter学习指南App,一起来玩Flutter吧~',
        'Flutter是谷歌的移动UI框架，可以快速在iOS、Android、Web和PC上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。同时它也是构建未来的Google Fuchsia应用的主要方式。'),
  ];
}
