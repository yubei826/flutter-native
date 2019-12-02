
import 'package:flutter/material.dart';

class QueryPage extends StatefulWidget {

  QueryPage(this.isLargeScreen);

  final bool isLargeScreen;

  @override
  _QueryPageState createState() => new _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.isLargeScreen? null : AppBar(
        title: new Text('Tuhu - 获取网络数据'),
      ),
      body: new Container(
        padding: EdgeInsets.only(top: 200),
        alignment: Alignment.topCenter,
        child: new Text('待开发, 原谅我...', style: new TextStyle(fontSize: 26),),
      )
    );
  }
}