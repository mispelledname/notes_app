import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase API
/// 
/// Perform queries more easily.
/// 
class FirebaseApi{
  final Firestore _db = Firestore.instance;
  // collection name 
  final String path;
  CollectionReference ref;

  FirebaseApi( this.path ) {
    ref = _db.collection(path);
  }

  /// return all documents as a QuerySnapshot
  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }

  /// return documents as a strem of QuerySnapshots 
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }

  /// return a snapshot of a document by id
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  /// remove document from database by id
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }

  /// add new document to database collection
  Future<void> addDocument(Map data) {
    return ref.document(data['id']).setData(data);
    // return ref.add(data);
  }

  /// update data in specified document in database 
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }


}