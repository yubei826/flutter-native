
import 'package:flutter/material.dart';
import 'package:flutter_native/components/context.dart';
import 'package:flutter_native/components/menu.dart';
import 'package:flutter_native/views/calc_page/index.dart';



class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => new _IndexPageState();
}


class _IndexPageState extends State<IndexPage> {
  bool isLargeScreen; //是否是大屏幕
  String selectValue = ''; //保存选择的内容

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tuhu Demo'),
      ),
      body: new OrientationBuilder(builder: (context, orientation) {
        print("width:${MediaQuery.of(context).size.width}");
        print("height:${MediaQuery.of(context).size.height}");
        //判断屏幕宽度
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        //两个widget是放在一个Row中进行显示，如果是小屏幕的话，用一个空的Container进行占位
        //如果是大屏幕的话，则用Expanded进行屏幕的划分并显示详细视图
        return new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Menu(
                itemSelectedCallback: (value) {
                  //定义列表项的点击回调
                  if (isLargeScreen) {
                    selectValue = value;
                    setState(() {});
                  } else {
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) {
                        return new DetailWidget(isLargeScreen, value);
                      })
                    );
                  }
                }
              )
            ),
            isLargeScreen
                ? new Expanded(
                    flex: 2,
                    child: new DetailWidget(isLargeScreen, selectValue)
                  )
                : new Container()
          ],
        );
      }),
    );
  }
}


//详细视图的Widget
class DetailWidget extends StatelessWidget {
  final String pageName;
  final bool isLargeScreen;

  DetailWidget(this.isLargeScreen, this.pageName);

  // 获取页面
  _getPage() {
    switch (this.pageName) {
      case '按钮':
        return new CalcPage(isLargeScreen);
        break;
      case '弹窗':
        return new CalcPage(isLargeScreen);
        break;
      case '无状态组件':
        return new CalcPage(isLargeScreen);
        break;
      case '有状态组件':
        return new CalcPage(isLargeScreen);
        break;
      default: return new CalcPage(isLargeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEEEEEE),
        child: new Center(
          child: _getPage(),
        ),
      ),
    );
  }
}