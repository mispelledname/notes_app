import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';

class SearchButton extends StatelessWidget {
  SearchButton({@required this.onPressed});
  final GestureTapCallback onPressed; 
  
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: MaterialButton(
        color: Colors.white.withOpacity(0.3),
        splashColor: Colors.white.withOpacity(0.1),
        minWidth: 25,
        child: Padding(
          padding: EdgeInsets.all(0.0),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}