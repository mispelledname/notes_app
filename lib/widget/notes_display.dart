import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/model/CRUDModel.dart';
import 'package:notesapp/widget/note_card.dart';

/// Notes Display
/// 
/// Displays the notes stored in Firebase on the Home Screen as a List.
/// 
class NotesDisplay extends StatefulWidget {
  @override
  _NotesDisplayState createState() => _NotesDisplayState();
}

class _NotesDisplayState extends State<NotesDisplay> {
  
  List<Note> notes; 
  ScrollController _controller;

  /// Scroll Listener for scrolling
  _scrollListener() {
    // scroller reached the bottom 
    if (_controller.offset >= _controller.position.maxScrollExtent &&
      !_controller.position.outOfRange) {}

    // scroller reached the top 
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {}
  }

  /// Initialize widget and scroller 
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }
  
  /// Build Notes Display 
  /// 
  /// Making a StreamBuilder to listen to changes in firebase in real time.
  @override
  Widget build(BuildContext context) {

    // service provider to fetch stream of notes 
    final streamProvider = Provider.of<CRUDModel>(context);

    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: streamProvider.fetchNotesAsStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          
          // Handling errors from firebase
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          
          switch (snapshot.connectionState) {
            
            // Data is still loading 
            case ConnectionState.waiting: return Text('Loading...');

            // Display data using List Builder 
            default:
              notes = snapshot.data.documents
                        .map((doc) => Note.fromMap(doc.data, doc.documentID))
                        .toList();
              return Container(
                height: MediaQuery.of(context).size.height * Constants.notesDisplayContainerHeight,
                child: new ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  controller: _controller,
                  itemCount: notes.length,
                  itemBuilder: (buildContext, index) =>
                    Container(
                      margin: EdgeInsets.only(bottom: Constants.noteCardItemSpacing),
                      child: NoteCard(note: notes[index])
                    )
                )
              );
          }
        },
      ),
    );
  }
}