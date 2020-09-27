import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.calculated,
      @required this.describe,
      @required this.result,
      @required this.minimum,
      @required this.maximum});
  final String
      calculated; //those ones allow us to assign the values we get from input_page.dart to their places which are dawn here
  final String result;
  final String describe;
  final String minimum;
  final String maximum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kInActiveCardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    result,
                    style: TextStyle(color: Colors.red, fontSize: 25.0),
                  ),
                  Text(calculated,
                      style: TextStyle(
                          fontSize: 100.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'Your Weight should be between ($minimum-$maximum)Kg.',textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey[200]),
                  ),
                  Text(
                    describe,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: kPinkishColor,
                child: Center(
                    child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
