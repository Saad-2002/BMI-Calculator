import 'package:bmi_calculator/Results_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ExtractedWidgets.dart';
import 'Constants.dart';
import 'Calculator_Brain.dart';
import 'Results_Page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//I have commented the old way and wrote the new one (Ternary Operator) instead ((because it took me a lot of ef fort to create it))
//  Color maleCardColor=InActiveCardColor;
//  Color femaleCardColor=InActiveCardColor;
//    void updateCardColor(Gender selectedGender){
//
//    if(selectedGender==Gender.male){
//    if(maleCardColor==InActiveCardColor){maleCardColor=ActiveCardColor;femaleCardColor=InActiveCardColor;}
//    else maleCardColor=InActiveCardColor;
//    }
//    else if(selectedGender==Gender.female){
//    if(femaleCardColor==InActiveCardColor){femaleCardColor=ActiveCardColor;maleCardColor=InActiveCardColor;}
//    else femaleCardColor=InActiveCardColor;
//    }
//
//  }
  Gender selectedGender;
  int height = 175, weight = 60, age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                        print('user pressed the male Button');
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor, //maleCardColor ,
                    widgetChild: Center(
                      child: GenderSelection(FontAwesomeIcons.mars, 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor, //femaleCardColor,
                    widgetChild: Center(
                      child: GenderSelection(FontAwesomeIcons.venus, 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableWidget(
              colour: kInActiveCardColor,
              widgetChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Height',
                        style: kLabelTextStyle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment
                        .baseline, //its going to put the children at the same baseline
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 35,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        print(newValue);
                        height = newValue
                            .round(); //it turns it to an integer instead of a double (the nearest hall number)
                      });
                    },
                    activeColor: kPinkishColor,
                    inactiveColor: kActiveCardColor,
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
                  child: ReusableWidget(
                    colour: kInActiveCardColor,
                    widgetChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              childWidget: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childWidget: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: kInActiveCardColor,
                    widgetChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              childWidget: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childWidget: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex:1 ,
            child: GestureDetector(
              onTap: () {
                setState(
                  () {
                    CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);//this one is created to allow us to use CalculatorBrain as an object
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          calculated: calc.calculateBMI(),
                          describe: calc.getInterpretation(),
                          result: calc.getResult(),
                          minimum: calc.calculateMinimum(),
                          maximum: calc.calculateMaximum(),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                color: kPinkishColor,
                margin: EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
