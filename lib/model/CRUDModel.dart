import 'package:flutter/material.dart';
import 'package:notesapp/model/firebase_api.dart';
import 'package:notesapp/util/locator.dart';
import 'package:notesapp/model/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

/// CRUD Model for Firestore 
/// 
/// More easily create, read, update, and delete notes from Firebase. 
/// 
class CRUDModel extends ChangeNotifier {
  FirebaseApi _api = locator<FirebaseApi>();

  // local list of notes 
  List<Note> notes;

  /// Fetch notes as a list 
  Future<List<Note>> fetchNotes() async {
    var result = await _api.getDataCollection();
    notes = result.documents
        .map((doc) => Note.fromMap(doc.data, doc.documentID))
        .toList();
    return notes;
  }

  /// Fetch notes as a stream
  Stream<QuerySnapshot> fetchNotesAsStream() {
    return _api.streamDataCollection();
  }

  /// Get note from database by id
  Future<Note> getNoteById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Note.fromMap(doc.data, doc.documentID) ;
  }

  /// Remove note from database by id
  Future removeNote(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  
  /// Update a specified note in the database
  Future updateNote(Note data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }


  /// Add a new note to the database
  Future addNote(Note data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}