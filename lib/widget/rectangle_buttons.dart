import 'package:flutter/material.dart';
import 'package:notesapp/util/constants.dart';

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
      color: widget.buttonColor,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * Constants.rectangleButtonWidth,
        height: Constants.rectangleButtonHeight, 
        child: widget.buttonText
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Constants.rectangleButtonBorderRadius)),
      ),
      onPressed: widget.onTap,
    );
  }
}