import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';

class AddButton extends StatelessWidget {
  
  AddButton({@required this.onTap}); 
  final GestureTapCallback onTap; 

  // main add button
  Widget _addOptions() {
    return ClipOval(
      child: Material(
        color: AppColor.accentColor1,
        child: InkWell(
          splashColor: AppColor.accentColor1.withOpacity(0.1),
          child: SizedBox(width: 60, height: 60, child: Icon(Icons.add)),
          onTap: () {},
        ),
      ),
    );
  }

  // button to add text note
  Widget _addTextNote() {
    return ClipOval(
      child: Material(
        color: AppColor.accentColor1,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.1),
          child: SizedBox(width: 60, height: 60, child: Icon(Icons.create)),
          onTap: () {},
        ),
      ),
    );
  }

  // button to add recording 
  Widget _addRecording() {
    return ClipOval(
      child: Material(
        color: AppColor.accentColor1,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.1),
          child: SizedBox(
            width: Constants.roundButtonSize, 
            height: Constants.roundButtonSize, 
            child: Icon(Icons.mic)
            ),
          onTap: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mainLeftPosition = (MediaQuery.of(context).size.width - Constants.roundButtonSize) * 0.5;
    
    return Stack(children: <Widget>[
      // main button
      Positioned(
        child: _addOptions(),
        left: mainLeftPosition, 
        top: MediaQuery.of(context).size.height - Constants.roundButtonSize
      ),
      // add text
      Positioned(
        child: _addTextNote(),
        left: (MediaQuery.of(context).size.width - Constants.roundButtonSize) * 0.5 - Constants.smallButtonOptionHorizontalOffset, 
        top: MediaQuery.of(context).size.height - Constants.roundButtonSize - Constants.buttonOptionVerticalOffset,
      ),
      // add recording 
      Positioned(
        child: _addRecording(),
        left: (MediaQuery.of(context).size.width - Constants.roundButtonSize) * 0.5 + Constants.smallButtonOptionHorizontalOffset, 
        top: MediaQuery.of(context).size.height - Constants.roundButtonSize - Constants.buttonOptionVerticalOffset,
      ),
    ],);
  }
}