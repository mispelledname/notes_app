import 'package:flutter/material.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/widget/recorded_text.dart';
import 'package:notesapp/widget/audio_recording.dart';
import 'package:speech_recognition/speech_recognition.dart';

/// New Recording widget
/// 
/// Widget that displays current audio recording and action buttons 
/// related to new recordings
/// 
class NewRecording extends StatefulWidget {
  
  // boolean to indicate if this widget is hidden from screen
  final bool isHidden; 
  // call back function to add a new recording 
  final GestureTapCallback addRecordingCallback; 

  NewRecording({@required this.isHidden, this.addRecordingCallback});
  
  @override
  _NewRecordingState createState() => _NewRecordingState();
}

class _NewRecordingState extends State<NewRecording> {
  
  // text currently being recorded 
  String text; 
  // speech recognition
  SpeechRecognition speechRec;
  bool isReady;
  bool isListening;
  String resultText = Constants.emptyString;
  String currentLocale = Constants.englishLocale;

  /// initiate speech recognition 
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
  void initState(){ 
    super.initState();
    setState(() {
      text = "";
    });
    initSpeechRecognition();
  }

  /// listen to audio and store text in 'result'
  void record(){
    if (isReady && !isListening){
      speechRec
      .listen(locale: currentLocale)
      .then((result)=> 
      print('_MyAppState.start => result ${result}')); // debug
    }
  }

  /// stops listening 
  void stop(){
    if (isListening){
      speechRec
      .stop()
      .then((result) => setState(()=> isListening = result));
    }
  }

  /// prematurely cancels the recording 
  void cancel(){
    if (isListening){
      speechRec
      .cancel()
      .then((result) => setState(()=> isListening = result));
    }
  }

  /// update text currently on display 
  void updateText(String newText) {
    setState(() {
      text = newText; 
    });
  }

  /// build back button
  Widget _buildBackButton() {
    return MaterialButton(
      minWidth: Constants.backButtonMinWidth,
      child: Icon(
        Icons.arrow_back, 
        color: Colors.black, size: 
        Constants.backButtonIconSize
        ),
      onPressed: widget.addRecordingCallback,
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
        // style the widget 
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
          // display recorded text
          RecordedText(text: this.text),
          AudioRecording(updateText: updateText), 
        ],)
      ),
    ); 
  }
  
  /// Builder for NewRecording widget 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isHidden? null : _buildNewRecording(context),
    );
  }
}