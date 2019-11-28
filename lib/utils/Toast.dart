
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Toast extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text(''),
    );
  }

  Toast.show(_context) {
    var t = Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color:  Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: new Text('$_context', style: TextStyle(fontSize: 20),),),
    );
    showToastWidget(t);
  }
}

