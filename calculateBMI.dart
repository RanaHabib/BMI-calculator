import 'package:bmicalculator/Card.dart';
import 'package:bmicalculator/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BMIbrain.dart';

class calculateBMI extends StatelessWidget {
  calculateBMI({this.result,this.bmi,this.desc});
  final String result;
  final String bmi;
  final String desc;
  BMIbrain brain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculatior',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              colour: inactiveCard,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: ktitleStyle,
                  ),
                  Text(
                    desc,
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
