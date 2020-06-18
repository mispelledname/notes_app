import 'package:flutter/material.dart';
import 'package:notesapp/util/constants.dart';

/// Rectangle Button
/// 
/// Can customize color, text, and callback function. 
/// 
class RectangleButton extends StatefulWidget {
  
  final Color buttonColor;
  final Text buttonText; 
  final GestureTapCallback onTap; 

  RectangleButton({@required this.buttonColor, this.buttonText, this.onTap});
  
  @override
  _RectangleButtonState createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {
  @override
  Widget build(BuildContext context) {

    return FlatButton(

      // button aesthetics 
      color: widget.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Constants.rectangleButtonBorderRadius)
        ),
      ),

      // button contents 
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * Constants.rectangleButtonWidth,
        height: Constants.rectangleButtonHeight, 
        child: widget.buttonText
      ),

      // callback function 
      onPressed: widget.onTap,
    );
  }
}