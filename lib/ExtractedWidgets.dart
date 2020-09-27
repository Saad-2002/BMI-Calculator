import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class GenderSelection extends StatelessWidget {
  GenderSelection(this.genderIcon, this.genderString);
  final IconData genderIcon;
  final String genderString;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderString,
          style:kLabelTextStyle,
        )
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  ReusableWidget({this.colour, this.widgetChild,this.onPress});
  final Color colour;
  final Widget widgetChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration:
            BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
        child: widgetChild,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
    RoundIconButton({this.childWidget,this.onPressed});
    final Icon childWidget;
    final Function onPressed;
    @override
    Widget build(BuildContext context) {
    return RawMaterialButton(
    shape:CircleBorder(),
    constraints: BoxConstraints.tightFor(width: 50.0,height: 50.0),
    fillColor: Color(0xFF4C4F5E),
    elevation: 10.0,
    onPressed: onPressed,
    child:Center(child: childWidget),

    );
  }
}

