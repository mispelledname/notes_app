class Note {
  final String title; 
  final String content; 
  // final DateTime dateCreated; 

  Note({
    this.title, 
    this.content,
    // this.dateCreated
  });

  // convert to Note object from Json
  Note.fromMap(Map snapshot, String id)
      : title = snapshot['title'],
      content = snapshot['content'];
      // dateCreated = DateTime.fromMillisecondsSinceEpoch(snapshot['dateCreated']);

  // convert to Json from Note object
  toJson() {
    return {
      'title' : title,
      'content': content,
      // 'dateCreated': dateCreated
    };
  }
}