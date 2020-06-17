import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/small_round_button.dart';

class AddButton extends StatefulWidget {
  
  final GestureTapCallback addRecordingCallback; 
  final GestureTapCallback addTextCallback; 

  AddButton({@required this.addRecordingCallback, this.addTextCallback});

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> with SingleTickerProviderStateMixin{
  
  double mainLeftPosition;
  double mainTopPosition;
  double midHorizontal;
  bool _isButtonDisabled = true;
  AnimationController _controller;
  Animation _animation;
  final Tween<double> turnsTween = Tween<double>(
    begin: 0,
    end: Constants.buttonRotationAmount,
  );

  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Constants.buttonAnimationDuration),
    );
    _animation = CurvedAnimation(
      parent: _controller, 
      curve: Curves.easeIn, 
      reverseCurve: Curves.easeOut
    );
    super.initState();
  }

  // main add button
  Widget _addOptions() {
    return ClipOval(
      child: Material(
        color: AppColor.accentColor1,
        child: InkWell(
          splashColor: AppColor.accentColor1.withOpacity(0.1),
          child: SizedBox(
            width: Constants.roundButtonSize, 
            height: Constants.roundButtonSize, 
            child: Icon(Icons.add, size: Constants.addButtonIconSize),
          ),
          onTap: () {
            // animation
            if (_isButtonDisabled) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            // changes visibility of small buttons on tap 
            setState(() {
              _isButtonDisabled = !_isButtonDisabled; 
            });
          },
        ),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {

    midHorizontal = MediaQuery.of(context).size.width * 0.5;
    mainLeftPosition = (MediaQuery.of(context).size.width - Constants.roundButtonSize) * 0.5;
    mainTopPosition = MediaQuery.of(context).size.height - Constants.roundButtonSize - Constants.buttonOptionVerticalOffset; 

    return Stack(children: <Widget>[
      // add text
      Positioned(
        child: SmallButton(iconData: Icons.create, 
        onTap:(){ // when text button is pressed
          widget.addTextCallback;
        } , 
        isButtonDisabled: _isButtonDisabled),
        left: midHorizontal - Constants.smallButtonOptionHorizontalOffset - Constants.smallRoundButtonSize, 
        top: mainTopPosition - Constants.smallButtonOptionVerticalOffset,
      ),
      // add recording 
      Positioned(
        child: SmallButton(iconData: Icons.mic,
        onTap:(){
          widget.addRecordingCallback;
        } , 
        isButtonDisabled: _isButtonDisabled),
        left: midHorizontal + Constants.smallButtonOptionHorizontalOffset, 
        top: mainTopPosition - Constants.smallButtonOptionVerticalOffset,
      ),
      // main button
      Positioned(
        left: mainLeftPosition, 
        top: mainTopPosition,
        child: RotationTransition(
          turns: turnsTween.animate(_animation),
          child: _addOptions()
        ),
      ),
    ],);
  }
}