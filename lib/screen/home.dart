import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/widget/notes_display.dart';
import 'package:notesapp/widget/search_button.dart';
import 'package:notesapp/widget/add_button.dart';
import 'package:notesapp/screen/new_recording.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _addingRecording; 
  bool _addingText; 

  void initState() {
    super.initState();
    _addingRecording = false; 
    _addingText = false; 
  }

  // open screen to add recording 
  void addRecording() {
    setState(() {
      _addingRecording = !_addingRecording; 
    });
  }

  // open screen to add recording 
  void addTextNote() {
    setState(() {
      _addingText = !_addingText; 
    });
  }

  // build new Recording Screen
  Widget _buildNewRecording() {
    return new NewRecording(
      isHidden: !_addingRecording, 
      addRecordingCallback: addRecording
    );
  }

  // build the title and search bar 
  Widget _buildTitle() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Notes", 
            style: Theme.of(context).textTheme.headline1,
          ),
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
          // Buttons to add notes/ recordings
          AddButton(
            addRecordingCallback: addRecording, 
            addTextCallback: addTextNote,
          ),
          // Add recording
          _buildNewRecording(),
          // Add text note 
        ]
      ),
    ); 
  }
}