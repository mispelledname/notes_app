import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed});
  final GestureTapCallback onPressed;
 
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: AppColor.lightBgColor.withOpacity(0.8),
      splashColor: AppColor.lightBgColor.withOpacity(0.7),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.search,
              color: Colors.white,
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}