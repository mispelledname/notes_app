import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';

class SmallButton extends StatefulWidget {
  
  final GestureTapCallback onTap; 
  final IconData iconData; 
  final bool isButtonDisabled;

  SmallButton({@required this.iconData, this.onTap, this.isButtonDisabled}); 
  
  @override
  _SmallButtonState createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {

  @override
  Widget build(BuildContext context) {

    return ClipOval(
      child: Opacity(
        opacity: widget.isButtonDisabled ? 0 : 0.9,
        child: Material(
          color: Colors.white.withOpacity(0.3),
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
