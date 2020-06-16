import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/recorded_text.dart';
import 'package:notesapp/widget/audio_recording.dart';

class NewRecording extends StatefulWidget {
  
  final bool isHidden; 
  final GestureTapCallback addRecordingCallback; 

  NewRecording({@required this.isHidden, this.addRecordingCallback});
  
  @override
  _NewRecordingState createState() => _NewRecordingState();
}

class _NewRecordingState extends State<NewRecording> {
  
  String text; 

  void initState() {
    super.initState();
    setState(() {
      text = "";
    });
  }

  void updateText(String newText) {
    setState(() {
      text = newText; 
    });
  }

  Widget _buildRecordingTitle() {
    return Container(
      padding: EdgeInsets.only(bottom: Constants.noteItemSpacing),
      child: Row(children: <Widget>[
        MaterialButton(
          minWidth: Constants.backButtonMinWidth,
          child: Icon(
            Icons.arrow_back, 
            color: Colors.black, size: 
            Constants.backButtonIconSize
            ),
          onPressed: widget.addRecordingCallback,
        ),
        Text("Record", style: Theme.of(context).textTheme.headline2)
      ],)
    );
  }

  Widget _buildNewRecording(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // style 
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
        // children
        child: Column(children: <Widget>[
          _buildRecordingTitle(),
          RecordedText(text: this.text),
          AudioRecording(updateText: updateText), 
        ],)
      ),
    ); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isHidden? null : _buildNewRecording(context),
    );
  }
}