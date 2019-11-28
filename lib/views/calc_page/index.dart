
import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {

  CalcPage(this.isLargeScreen);

  bool isLargeScreen;

  @override
  _CalcPageState createState() => new _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {

  int num = 0;

  void addNum() {
    setState(() {
      num++;
    });
  }

  void reduceNum() {
    setState(() {
      num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.isLargeScreen? null : AppBar(
        title: new Text('Tuhu - 有状态组件'),
      ),
      body: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 100),
        child: new Column(
          children: <Widget>[
            // 数值
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
              child: new Text(this.num.toString()),
            ),

            // 加减按钮
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
                      this.addNum();
                      print('加:::$num');
                    },
                    child: new Text('数值+'),
                  ),
                  new RaisedButton(
                    onPressed: () {
                      this.reduceNum();
                      print('减:::$num');
                    },
                    child: new Text('数值-'),
                  ),
                ],
              ),
            ),
          ],
        ), 
      )
    );
  }
}