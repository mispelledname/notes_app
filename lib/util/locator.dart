import 'package:get_it/get_it.dart';
import 'package:notesapp/model/firebase_api.dart';
import 'package:notesapp/model/CRUDModel.dart';
import 'package:notesapp/model/format_date_time.dart';
import 'package:notesapp/model/speech_recognition.dart';

GetIt locator = GetIt.instance;

/// Set up Services Locator
/// 
/// Enables widgets to accesss services in the application. 
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseApi('notes'));
  locator.registerLazySingleton(() => CRUDModel());
  locator.registerLazySingleton(() => FormatDateTime());
  locator.registerLazySingleton(() => SpeechRecognitionApi());
}