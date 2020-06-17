import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/rectangle_buttons.dart';

/// Audio Recording 
/// 
/// Widget contains 
class AudioRecording extends StatefulWidget {
  
  final Function updateText;

  AudioRecording({@required this.updateText});
  
  @override
  _AudioRecordingState createState() => _AudioRecordingState();
}

class _AudioRecordingState extends State<AudioRecording> {

  /// Build Split Button
  /// 
  /// When tapped, splits the recording into sections.
  /// Each section is comprised of a time stamp for when the section of the 
  /// recording began, and the text content in that section.
  /// (For later implementation stages).
  Widget _buildSplitButton() {
    return RectangleButton(
      buttonColor: AppColor.accentColor2,
      buttonText: Text("Split"),
      onTap: () {}
    );
  }

  /// Build Save Button
  /// 
  /// When tapped, saves the current audio and closes the recording widget.
  Widget _buildSaveButton() {
    return RectangleButton(
      buttonColor: AppColor.accentColor1,
      buttonText: Text("Save"),
      onTap: () {}
    );
  }

  /// build Audio Recording widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Constants.audioSidePadding, 
        right: Constants.audioSidePadding
      ),
      child: Column(children: <Widget>[

        // empty space to substitute audio wave form 
        // AudioWaveForm(),
        Container(
          height: 150, 
        ),

        // row of buttons 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // left split button 
            _buildSplitButton(),
            // right save button  
            _buildSaveButton(),
          ],
        ),
      ],)
    );
  }
}