import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/recorded_text.dart';
import 'package:notesapp/widget/audio_recording_buttons.dart';

/// New Recording widget
/// 
/// Widget that displays current audio recording and action buttons 
/// related to new recordings
/// 
class NewRecording extends StatefulWidget {

  // callback function to add a new recording 
  final GestureTapCallback addRecordingCallback; 
  // callback function to return to homescreen 
  final GestureTapCallback goBack; 
  // text currently being recorded 
  final String text; 

  NewRecording({this.addRecordingCallback, this.goBack, this.text});
  
  @override
  _NewRecordingState createState() => _NewRecordingState();
}

class _NewRecordingState extends State<NewRecording> {

  /// build back button
  Widget _buildBackButton() {
    return MaterialButton(
      // aesthetics 
      minWidth: Constants.backButtonMinWidth,
      // content
      child: Icon(
        Icons.arrow_back, 
        color: Colors.black, size: 
        Constants.backButtonIconSize
        ),
      // callback 
      onPressed: widget.goBack
    );
  }

  /// build the title of the new recording widget 
  Widget _buildRecordingTitle() {
    return Container(
      padding: EdgeInsets.only(bottom: Constants.noteItemSpacing),
      child: Row(children: <Widget>[
        // back button 
        _buildBackButton(), 
        // title 
        Text("Record", style: Theme.of(context).textTheme.headline2)
      ],)
    );
  }

  /// NewRecording widget builder 
  Widget _buildNewRecording(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(

        // widget aesthetics 
        padding: EdgeInsets.only(top: Constants.noteTopPadding),
        width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height * 0.7, 
        decoration: BoxDecoration(
          color: AppColor.lightContrast, 
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(Constants.noteBorderRadius), 
            topRight: const Radius.circular(Constants.noteBorderRadius)
          ),
        ),

        // widget contents 
        child: Column(children: <Widget>[
          // title 
          _buildRecordingTitle(),

          // display recorded text
          RecordedText(text: widget.text),

          // display audio recording wave form
          Container(height: 150),

          // audio recording buttons 
          AudioRecordingButtons(
            recordedText: widget.text,
          ), 
        ],)
      ),
    ); 
  }
  
  /// Builder for NewRecording widget 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildNewRecording(context),
    );
  }
}