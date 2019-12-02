

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/utils/Toast.dart';

class DialogPage extends StatelessWidget {

  DialogPage(this.isLargeScreen);

  final bool isLargeScreen;

  // Android 风格弹窗
  _showMyMaterialDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext content) {
        return AlertDialog(
          title: new Text('提示'),
          content: new Text('这是一个Android风格的弹窗'),
          actions:<Widget>[
            FlatButton(
              child: new Text('取消'),
              onPressed: () {
                Toast.show('取消了');
                Navigator.of(context).pop();
              },
            ),

            FlatButton(
              child: new Text('确定'),
              onPressed: () {
                Toast.show('确定了');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  // iOS 风格弹窗
  _showCupertinoDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext content) {
        return CupertinoAlertDialog(
          title: new Text('提示'),
          content: new Text('这是一个iOS风格的弹窗'),
          actions:<Widget>[
            CupertinoDialogAction(
              child: new Text('取消'),
              onPressed: () {
                Toast.show('取消了');
                Navigator.of(context).pop();
              },
            ),

            CupertinoDialogAction(
              child: new Text('确定'),
              onPressed: () {
                Toast.show('确定了');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: isLargeScreen? null : AppBar(
        title: new Text('Tuhu - 弹窗'),
      ),
      body: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 100),
        child: new Column(
          children: <Widget>[

            new FlatButton(
              onPressed: () {
                _showMyMaterialDialog(context);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Android风格弹窗'),
            ),

            new FlatButton(
              onPressed: () {
                _showCupertinoDialog(context);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('iOS风格弹窗'),
            )
          ],
        ), 
      )
    );
  }
}