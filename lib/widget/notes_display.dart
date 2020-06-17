import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/model/CRUDModel.dart';
import 'package:notesapp/widget/note_card.dart';

class NotesDisplay extends StatefulWidget {
  @override
  _NotesDisplayState createState() => _NotesDisplayState();
}

class _NotesDisplayState extends State<NotesDisplay> {
  
  List<Note> notes; 
  ScrollController _controller;
  
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    String message;

    // scroll listener for scrolling
    _scrollListener() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
        setState(() {
          message = "reach the bottom";
        });
      }
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          message = "reach the top";
        });
      }
    }

    @override
    void initState() {
      _controller = ScrollController();
      _controller.addListener(_scrollListener);
      super.initState();
    }

    return Container(
      // Making a StreamBuilder to listen to changes in real time
      child: StreamBuilder<QuerySnapshot>(
        stream: productProvider.fetchProductsAsStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // Handling errors from firebase
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            // Display if still loading data
            case ConnectionState.waiting: return Text('Loading...');
            default:
              notes = snapshot.data.documents
                        .map((doc) => Note.fromMap(doc.data, doc.documentID))
                        .toList();
              return Container(
                height: MediaQuery.of(context).size.height * Constants.notesDisplayContainerHeight,
                color: AppColor.accentColor1,
                child: new ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  controller: _controller,
                  itemCount: notes.length,
                  itemBuilder: (buildContext, index) =>
                    // ListTile(title: Text('test', style: TextStyle(color: Colors.white)))
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