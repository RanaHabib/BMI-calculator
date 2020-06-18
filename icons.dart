import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  CardContent({this.text,this.cardIcon,this.myStyle});

  final String text;
  final IconData cardIcon;
  final TextStyle myStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: myStyle
        ),
      ],
    );
  }
}
