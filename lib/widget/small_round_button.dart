import 'package:flutter/material.dart';
import 'package:notesapp/util/constants.dart';

/// Small Round Button
/// 
/// Can customize button icon and callback funtion.
/// Can be disabled (disappears completely).
/// 
class SmallButton extends StatefulWidget {
  
  final GestureTapCallback onTap; 
  final IconData iconData; 
  final bool isButtonDisabled;

  SmallButton({@required this.iconData, this.onTap, this.isButtonDisabled}); 
  
  @override
  _SmallButtonState createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {

  /// build Small Round button 
  /// 
  /// If button is disabled, its opacity is zero, and its gestures
  /// are ignored. 
  @override
  Widget build(BuildContext context) {
    
    return ClipOval(
      child: Opacity(
        opacity: widget.isButtonDisabled ? 0 : 0.9,
        child: Material(
          color: Colors.white.withOpacity(0.5),
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.3),
            child: SizedBox(
              width: Constants.smallRoundButtonSize, 
              height: Constants.smallRoundButtonSize, 
              child: Icon(widget.iconData, color: Colors.white)
            ),
            onTap: widget.isButtonDisabled ? null : widget.onTap,
          ),
        ),
      ),
    );
  }
}
