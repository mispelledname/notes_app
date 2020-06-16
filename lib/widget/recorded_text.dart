import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';

class RecordedText extends StatefulWidget {
  
  String text;

  RecordedText({@required this.text});
  
  @override
  _RecordedTextState createState() => _RecordedTextState();
}

class _RecordedTextState extends State<RecordedText> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * Constants.recordedTextWidth, 
      height: MediaQuery.of(context).size.height * Constants.recordedTextHeight, 
      padding: EdgeInsets.all(Constants.recordedTextPadding),
      decoration: BoxDecoration(
        color: AppColor.lightBgColor,
        borderRadius: BorderRadius.circular(Constants.recordedTextBorderRadius),
      ),
      child: Text("${widget.text}", style: Theme.of(context).textTheme.bodyText1),
    );
  }
}