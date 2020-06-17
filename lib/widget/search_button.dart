import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';

/// Search Button
/// 
/// When tapped, takes the user into the search screen
/// to search through their notes.
/// 
class SearchButton extends StatelessWidget {
  final GestureTapCallback onPressed; 

  SearchButton({@required this.onPressed});

  /// build Search Button 
  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity: 0.5,
      child: MaterialButton(

        // button aesthetics 
        color: Colors.white.withOpacity(0.3),
        splashColor: Colors.white.withOpacity(0.1),
        minWidth: 25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),

        // button content (search icon)
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

        // button callback 
        onPressed: onPressed,   
      ),
    );
  }
}