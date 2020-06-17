import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/rectangle_buttons.dart';

class AudioRecording extends StatefulWidget {
  
  Function updateText;

  AudioRecording({@required this.updateText});
  
  @override
  _AudioRecordingState createState() => _AudioRecordingState();
}

class _AudioRecordingState extends State<AudioRecording> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Constants.audioSidePadding, 
        right: Constants.audioSidePadding
      ),
      child: Column(children: <Widget>[
        // AudioWaveForm(),
        Container(
          height: 150, 
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RectangleButton(
              buttonColor: AppColor.accentColor2,
              buttonText: Text("Split"),
              onTap: () {}
            ),
            RectangleButton(
              buttonColor: AppColor.accentColor1,
              buttonText: Text("Save"),
              onTap: () {}
            ),
          ],
        ),
      ],)
    );
  }
}