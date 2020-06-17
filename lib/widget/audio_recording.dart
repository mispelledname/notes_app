import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/rectangle_buttons.dart';
import 'package:speech_recognition/speech_recognition.dart';

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

  // speech recognition
  SpeechRecognition speechRec;
  bool isReady;
  bool isListening;
  String resultText = Constants.emptyString;
  String currentLocale = Constants.englishLocale;

  // initiate speech recognition 
  void initSpeechRecognition(){
    speechRec = new SpeechRecognition(); // constructor 
    isReady = false;
    isListening = false;
    // defining in built functions to deal with our local variables
    speechRec.setAvailabilityHandler((bool result) => setState(()=> isReady = result));
    speechRec.setCurrentLocaleHandler((String locale) => setState(() => currentLocale = locale));
    speechRec.setRecognitionStartedHandler( () => setState(()=> isListening = true));
    speechRec.setRecognitionResultHandler((String text) => setState(() => resultText = text));
    speechRec.setRecognitionCompleteHandler(() => setState(()=> isListening = false));
    speechRec.activate().then((res) => setState(()=> isReady = res));
  }

  @override
  void initState(){ // constructor
    super.initState();
    initSpeechRecognition();
  }

  // listen to audio and store text in 'result'
  void record(){
    print("record debug");
    if (isReady && !isListening){
      speechRec
      .listen(locale: currentLocale)
      .then((result)=> 
      print('_MyAppState.start => result ${result}')); // debug
    }
  }
  
  // stops listening 
  void stop(){
    if (isListening){
      speechRec
      .stop()
      .then((result) => setState(()=> isListening = result));
    }
  }

  // prematurely cancels the recording 
  void cancel(){
    if (isListening){
      speechRec
      .cancel()
      .then((result) => setState(()=> isListening = result));
    }
  }


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
      onTap: (){
        record();
      }
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