import 'package:flutter/material.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/util/router.dart';
import 'package:notesapp/widget/rectangle_buttons.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/model/CRUDModel.dart';

/// Audio Recording 
/// 
/// Widget contains two buttons 
class AudioRecordingButtons extends StatefulWidget {
  
  final String recordedText; 

  AudioRecordingButtons({@required this.recordedText});
  
  @override
  _AudioRecordingButtonsState createState() => _AudioRecordingButtonsState();
}

class _AudioRecordingButtonsState extends State<AudioRecordingButtons> {

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
  Widget _buildSaveButton(_firebaseProvider) {

    _saveNote() async {
      // do nothing if recorded no text 
      if (widget.recordedText == Constants.emptyString) {
        return ; 
      }
      // save note into firebase
      else {
        Note note = Note("Recording", widget.recordedText);
        await _firebaseProvider.addNote(note);
        Navigator.pushNamed(context, Router.homeRoute);
      }
    }

    return RectangleButton(
      buttonColor: AppColor.accentColor1,
      buttonText: Text("Save"),
      onTap: _saveNote,
    );
  }

  /// build Audio Recording widget
  @override
  Widget build(BuildContext context) {
    final _firebaseProvider = Provider.of<CRUDModel>(context);

    return Container(
      padding: EdgeInsets.only(
        left: Constants.audioSidePadding, 
        right: Constants.audioSidePadding
      ),
      child: Column(children: <Widget>[
        // row of buttons 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // left split button 
            _buildSplitButton(),
            // right save button  
            _buildSaveButton(_firebaseProvider),
          ],
        ),
      ],)
    );
  }
}