import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({this.content,this.colour});

  final Widget content;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: content,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
