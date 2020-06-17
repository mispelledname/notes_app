import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/model/note.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/model/CRUDModel.dart';
import 'package:notesapp/widget/note_card.dart';

class NotesDisplay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    List<Note> notes; 

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
              return ListView.builder(
                shrinkWrap: true,
                itemCount: notes.length,
                itemBuilder: (buildContext, index) =>
                  NoteCard(note: notes[index]),
              );
          }
        },
      ),
    );
  }
}