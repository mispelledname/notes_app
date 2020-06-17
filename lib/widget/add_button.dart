import 'package:flutter/material.dart';
import 'package:notesapp/screen/mask.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/small_round_button.dart';

/// Add Button Widget
/// 
/// The button on the bottom of the home screen.
/// When pressed, two more buttons appear to enable users to add recordings
/// or text notes. 
/// 
class AddButton extends StatefulWidget {
  
  // callback function for add recording button
  final GestureTapCallback addRecordingCallback; 
  // callback function for add text note button 
  final GestureTapCallback addTextCallback; 

  AddButton({@required this.addRecordingCallback, this.addTextCallback});

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> with SingleTickerProviderStateMixin{
  
  double mainLeftPosition;           // horizontal position of add button
  double mainTopPosition;            // vertical position of add button
  double midHorizontal;              // middle of the screen 
  bool _isButtonDisabled = true;     // true if add recording and add text note buttons are disabled 
  AnimationController _controller;   // animation controller for rotating the main add button 
  Animation _animation;              // rotation animation for the main add button 

  // start and end values for rotation animation 
  final Tween<double> turnsTween = Tween<double>(
    begin: 0,
    end: Constants.buttonRotationAmount,
  );

  /// initialize widget and animation 
  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Constants.buttonAnimationDuration),
    );
    _animation = CurvedAnimation(
      parent: _controller, 
      curve: Curves.bounceIn, 
      reverseCurve: Curves.easeOut
    );
    super.initState();
  }

  /// Main add button
  /// 
  /// When pressed, enables the add recording and add text note buttons
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
          // changes visibility of small buttons and starts animation, on tap 
          onTap: () {
            // animation
            if (_isButtonDisabled) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            setState(() {
              _isButtonDisabled = !_isButtonDisabled; 
            });
          },
        ),
      )
    );
  }

  /// Build a mask if Add Recording and Add Text Note buttons are enabled 
  Widget _buildMask(BuildContext context) {
    double opacity = _isButtonDisabled? 0 : Constants.maskOpacity1;
    return Mask(opacity: opacity);
  }
  
  @override
  Widget build(BuildContext context) {

    // Button Position 
    midHorizontal = MediaQuery.of(context).size.width * 0.5;
    mainLeftPosition = (MediaQuery.of(context).size.width - Constants.roundButtonSize) * 0.5;
    mainTopPosition = MediaQuery.of(context).size.height - Constants.roundButtonSize - Constants.buttonOptionVerticalOffset; 

    return Stack(children: <Widget>[
      // Mask layer 
      _buildMask(context), 
      // Add text note button 
      Positioned(
        child: SmallButton(iconData: Icons.create, onTap: widget.addTextCallback, isButtonDisabled: _isButtonDisabled),
        left: midHorizontal - Constants.smallButtonOptionHorizontalOffset - Constants.smallRoundButtonSize, 
        top: mainTopPosition - Constants.smallButtonOptionVerticalOffset,
      ),
      // Add Recording button 
      Positioned(
        child: SmallButton(iconData: Icons.mic, onTap: widget.addRecordingCallback, isButtonDisabled: _isButtonDisabled),
        left: midHorizontal + Constants.smallButtonOptionHorizontalOffset, 
        top: mainTopPosition - Constants.smallButtonOptionVerticalOffset,
      ),
      // Main Add button with animation 
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