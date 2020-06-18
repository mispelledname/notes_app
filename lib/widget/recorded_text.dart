import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';

/// Recorded Text
/// 
/// Widget to display the text that has currently been recorded 
/// via the Add Recording function. 
/// 
class RecordedText extends StatefulWidget {
  
  final String text;

  RecordedText({@required this.text});
  
  @override
  _RecordedTextState createState() => _RecordedTextState();
}

class _RecordedTextState extends State<RecordedText> {
  
  /// build Recorded Text
  @override
  Widget build(BuildContext context) {
    return Container(
      
      // aesthetics 
      width: MediaQuery.of(context).size.width * Constants.recordedTextWidth, 
      height: MediaQuery.of(context).size.height * Constants.recordedTextHeight, 
      padding: EdgeInsets.all(Constants.recordedTextPadding),
      decoration: BoxDecoration(
        color: AppColor.lightBgColor,
        borderRadius: BorderRadius.circular(Constants.recordedTextBorderRadius),
      ),

      // content display 
      child: Text("${widget.text}", style: Theme.of(context).textTheme.bodyText2),
    );
  }
}