import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

/// Note 
/// 
/// Model for the Note object in the application. 
/// 
class Note {
  // note title 
  final String id; 
  final String title; 
  final String content; 
  final DateTime dateCreated; 

  Note(this.title, this.content) 
    : id = Uuid().v4(),              // generate random document id 
    dateCreated = DateTime.now();    // dateCreated is now 

  /// instantiate note from map
  Note.fromMap(Map snapshot, String id)
    : id = snapshot['id'], 
    title = snapshot['title'],
    content = snapshot['content'],
    dateCreated = snapshot['dateCreated'].toDate(); 

  /// convert from Note object to JSON
  toJson() {
    return {
      'id' : id, 
      'title' : title,
      'content': content,
      'dateCreated': Timestamp.fromDate(dateCreated),
    };
  }
}