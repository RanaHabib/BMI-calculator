import 'package:bmicalculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Card.dart';
import 'icons.dart';
import 'variables.dart';
import 'calculateBMI.dart';
import 'BMIbrain.dart';
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCard;
  Color femaleColor = inactiveCard;
  int counter = 0;

  void activateColor(humanType type){
    type == humanType.male? maleColor = activeCard: femaleColor = activeCard;
  }
  void inactivateColor(humanType type){
    type == humanType.male? maleColor = inactiveCard: femaleColor = inactiveCard;
  }
  void updateColor(humanType type){
    if(counter%2==0){
      if(type == humanType.male){
       activateColor(humanType.male);
        inactivateColor(humanType.female);
      }
      else{
        activateColor(humanType.female);
        inactivateColor(humanType.male);
      }
    }
    else{
      if(type == humanType.male){
        inactivateColor(humanType.male);
      }
      else{
        inactivateColor(humanType.female);
      }
    }
    counter++;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(humanType.male);
                      });
                    },
                    child: MyCard(
                      colour: maleColor,
                      content: GestureDetector(
                          child: CardContent(
                            myStyle: myStyle,
                            text: 'MALE',
                            cardIcon: FontAwesomeIcons.mars),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(humanType.female);
                      });
                    },
                    child: MyCard(
                      colour: femaleColor,
                      content: CardContent(
                        myStyle: myStyle,
                        text: 'FEMALE',
                        cardIcon: FontAwesomeIcons.venus,),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: MyCard(
              colour: inactiveCard,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: myStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(heightValue.toString(),style: sliders),
                      Text('cm',style: myStyle)
                    ],
                  ),
                  Slider(
                    value: heightValue.toDouble(),
                    min: 100.0,
                    max: 220.0,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue){
                      setState(() {
                        heightValue = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    colour: inactiveCard,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: myStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: sliders,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              RoundButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                              SizedBox(width: 10,),
                              RoundButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },)
                            ],
                            ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    colour: inactiveCard,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: myStyle,
                        ),
                        Text(
                          age.toString(),
                          style: sliders,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            RoundButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(width: 10,),
                            RoundButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                BMIbrain brain = BMIbrain(height: heightValue,weight: weight);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => calculateBMI(bmi: brain.calculateBMI(),desc: brain.getDescreption(),result: brain.getResult()),
                ),);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CALCULATE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                color: Color(0xffeb1555),
                height: 5,
              ),
            ),
          )
        ],
      )
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundButton({this.icon,@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
