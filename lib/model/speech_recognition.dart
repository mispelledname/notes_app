import 'package:flutter/cupertino.dart';
import 'package:notesapp/util/constants.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecognitionApi with ChangeNotifier {

  SpeechRecognition speechRec;                            // speech recognition object 
  bool isReady;                                           // ready to listen
  bool isListening;                                       // listening 
  String resultText = Constants.emptyString;              // text from speech
  String currentLocale = Constants.englishLocale;         // locale / language

  SpeechRecognitionApi(){

    // initialize 
    this.speechRec = SpeechRecognition(); 
    this.isReady = true;
    this.isListening = false;
    this.resultText = Constants.emptyString; 

    // availability of listener 
    this.speechRec.setAvailabilityHandler((bool result) => isReady = result);

    // set locale / language 
    this.speechRec.setCurrentLocaleHandler((String locale) => currentLocale = locale);

    // started listening 
    this.speechRec.setRecognitionStartedHandler(() => isListening = true);

    // handle the result text 
    this.speechRec.setRecognitionResultHandler((String text) { 
      this.resultText = text;
      notifyListeners();
    });

    // when finished speaking 
    this.speechRec.setRecognitionCompleteHandler(() {
      isListening = false;
      this.resultText = Constants.emptyString; 
    });

    // activate speech recognition 
    this.speechRec.activate().then((res) => isReady = res);
  }

  /// begin listening 
  void record(){
    if (isReady && !isListening){
      this.speechRec
      .listen(locale: currentLocale)
      // .then((result)=> this.resultText = result); 
      .then((result) => print('_MyAppState.start => result $result'));
    }
  }

  /// stops listening 
  void stop(){
    if (isListening){
      this.speechRec
      .stop()
      .then((result) => isListening = result);
    }
  }

  /// prematurely cancels the recording 
  void cancel(){
    if (isListening){
      this.speechRec
      .cancel()
      .then((result) => isListening = result);
      this.resultText = Constants.emptyString;
    }
  }
}