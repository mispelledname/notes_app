/// Note 
/// 
/// Model for the Note object in the application. 
/// 
class Note {
  // note title 
  final String title; 
  final String content; 
  // final DateTime dateCreated; 

  Note({
    this.title, 
    this.content,
    // this.dateCreated
  });

  /// convert from JSON to Note object 
  Note.fromMap(Map snapshot, String id)
      : title = snapshot['title'],
      content = snapshot['content'];
      // dateCreated = DateTime.fromMillisecondsSinceEpoch(snapshot['dateCreated']);

  /// convert from Note object to JSON
  toJson() {
    return {
      'title' : title,
      'content': content,
      // 'dateCreated': dateCreated
    };
  }
}