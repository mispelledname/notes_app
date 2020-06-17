import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/notes_display.dart';
import 'package:notesapp/widget/search_button.dart';
import 'package:notesapp/widget/add_button.dart';
import 'package:notesapp/screen/new_recording.dart';
import 'package:notesapp/screen/mask.dart';

/// Home Screen
/// 
/// Main Screen of the application. 
/// 
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // displays new recording screen if true
  bool _addingRecording; 
  // displays new text note screen if true 
  bool _addingText; 

  void initState() {
    super.initState();
    _addingRecording = false; 
    _addingText = false; 
  }

  /// open screen to add recording 
  void addRecording() {
    setState(() {
      _addingRecording = !_addingRecording; 
    });
  }

  /// open screen to add text note 
  void addTextNote() {
    setState(() {
      _addingText = !_addingText; 
    });
  }

  /// build new Recording Screen
  Widget _buildNewRecording() {
    return new NewRecording(
      isHidden: !_addingRecording, 
      addRecordingCallback: addRecording
    );
  }

  /// build the title and search button
  Widget _buildTitle() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // title
          Text(
            "Notes", 
            style: Theme.of(context).textTheme.headline1,
          ),
          // search button
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: SearchButton(onPressed: () {})
            ),
          ),
        ],
      ),
    );
  }

  /// Build the mask 
  /// 
  /// When use is adding a new recoding / text note, masking adds to user 
  /// experience by adding contrast 
  Widget _buildMask(BuildContext context) {
    bool _displayMask = this._addingRecording || this._addingText;
    double opacity = _displayMask? Constants.maskOpacity2 : 0;
    return Mask(opacity: opacity);
  }
  
  /// Home Screen Builder 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top row with title and search button
          Container(
            padding: EdgeInsets.only(left: 20, top: 60, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildTitle(),
                NotesDisplay(),
              ],
            ),
          ),
          // Mask 
          _buildMask(context),
          // Buttons to add notes/ recordings
          AddButton(
            addRecordingCallback: addRecording, 
            addTextCallback: addTextNote,
          ),
          // Widget to add new recording 
          _buildNewRecording(),
          // Widget to dd text note 
        ]
      ),
    ); 
  }
}