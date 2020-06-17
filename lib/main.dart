import 'package:flutter/material.dart';
import 'util/router.dart';
import 'util/theme.dart';
import 'package:notesapp/util/locator.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/model/CRUDModel.dart';
import 'package:speech_recognition/speech_recognition.dart';

void main() {
  setupLocator();
  runApp(NotesApp());
}

class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  NavigatorObserverController observer = NavigatorObserverController();
  
  // speech recognition
  SpeechRecognition speechRec;
  bool isReady;
  bool isListening;
  String resultText = "";
  String currentLocale = 'en_US';

  @override
  void initState(){ // constructor
    super.initState();
    initSpeechRecognition();
  }

  void initSpeechRecognition(){
    speechRec = new SpeechRecognition(); // constructor 
    isReady = false;
    isListening = false;

    speechRec.setAvailabilityHandler((bool result) => setState(()=> isReady = result));
    speechRec.setCurrentLocaleHandler((String locale) => setState(() => currentLocale = locale));
    speechRec.setRecognitionStartedHandler( () => setState(()=> isListening = true));
    speechRec.setRecognitionResultHandler((String text) => setState(() => resultText = text));
    speechRec.setRecognitionCompleteHandler(() => setState(()=> isListening = false));
    speechRec.activate().then((res) => setState(()=> isReady = res));
  }
  // example functions: put inside onPressed(){} blocks
  void record(){
    if (isReady && !isListening){
      speechRec
      .listen(locale: currentLocale)
      .then((result)=> 
      print('_MyAppState.start => result ${result}')); // debug
      // stores completed transcription in resultText
    }
  }
  void stop(){
    if (isListening){
      speechRec
      .stop()
      .then((result) => setState(()=> isListening = result));
    }
  }
  void cancel(){
    if (isListening){
      speechRec
      .cancel()
      .then((result) => setState(()=> isListening = result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
      ],
      child: new MaterialApp(
        title: 'NotesApp',
        theme: appDarkTheme,
        initialRoute: Router.homeRoute,
        navigatorObservers: <NavigatorObserver>[observer],
        onGenerateRoute: Router.generateRoute,
      )
    );
  }
}

class NavigatorObserverController extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    print("Current route:  ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print("Current route:  ${previousRoute?.settings?.name}");
    super.didPop(route, previousRoute);
  }
}
