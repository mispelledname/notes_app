import 'package:flutter/material.dart';
import 'package:notesapp/model/firebase_api.dart';
import 'package:notesapp/util/locator.dart';
import 'package:notesapp/model/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class CRUDModel extends ChangeNotifier {
  FirebaseApi _api = locator<FirebaseApi>();

  List<Note> notes;

  Future<List<Note>> fetchProducts() async {
    var result = await _api.getDataCollection();
    notes = result.documents
        .map((doc) => Note.fromMap(doc.data, doc.documentID))
        .toList();
    return notes;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Note> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Note.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  
  Future updateProduct(Note data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Note data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}