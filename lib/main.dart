import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);//the user cant rotate the app screen anymore
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xff00e5ff),
        scaffoldBackgroundColor: Color(0xff0A0E21),
        appBarTheme: AppBarTheme(color: Color(0xff0A0E21)),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
