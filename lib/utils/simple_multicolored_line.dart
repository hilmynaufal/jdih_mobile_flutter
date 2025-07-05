import 'package:flutter/material.dart';

class SimpleMulticoloredLine {
  static final horizontal = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Container(
          height: 2,
          color: Colors.green,
        ),
      ),
      Expanded(
        child: Container(
          height: 2,
          color: Colors.blue,
        ),
      ),
      Expanded(
        child: Container(
          height: 2,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        child: Container(
          height: 2,
          color: Colors.red,
        ),
      )
    ],
  );

  //use with IntrinsicHeight
  static final vertical = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Container(
          width: 2,
          color: Colors.green,
        ),
      ),
      Expanded(
        child: Container(
          width: 2,
          color: Colors.blue,
        ),
      ),
      Expanded(
        child: Container(
          width: 2,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        child: Container(
          width: 2,
          color: Colors.red,
        ),
      )
    ],
  );
}
