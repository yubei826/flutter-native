
import 'package:flutter/material.dart';

//定义一个回调，决定是在同一个屏幕上显示更改详细视图还是在较小的屏幕上导航到不同界面。
typedef Null ItemSelectedCallback(String value);

class Menu extends StatefulWidget {

  ItemSelectedCallback itemSelectedCallback;

  Menu({@required this.itemSelectedCallback});

  @override
  _MenuState createState() => _MenuState();
}


class _MenuState extends State<Menu> {

  List<String> titleItems = <String> [
    '按钮', '弹窗', '无状态组件', '有状态组件'
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.menu),
    new Icon(Icons.menu),
    new Icon(Icons.menu),
    new Icon(Icons.menu),
  ];


  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    for (var i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(context, titleItems[i], iconItems[i]));
    }
    // 分割线
    var divideTiles = ListTile.divideTiles(context: context, tiles: _list).toList();

    return new ListView.builder(
      // 无分割线
      //  itemBuilder: (context, item) {
      //    return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
      //  },
      // 有分割线
      itemBuilder: (context, item) {
        return new Container(
          child: new Column(
            children: <Widget>[
              buildListData(context, titleItems[item], iconItems[item]),
              new Divider()
            ],
            ),
        );
      },
      itemCount: iconItems.length,
    );
  }

  Widget buildListData(BuildContext context, String titleItem, Icon iconItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        widget.itemSelectedCallback(titleItem);
      },
    );
  }
}
