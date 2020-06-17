import 'package:flutter/material.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/services/format_date_time.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/util/locator.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatefulWidget {
  final Note note; 

  NoteCard({@required this.note});
  
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  FormatDateTime _formatDateTime = locator<FormatDateTime>();
  
  // create text preview
  String _createContentPreview(String content) {
    int i = 0; 
    int currLen = 0; 
    String output = "";
    List<String> contentArr = content.split(" ");

    while (currLen < Constants.maxContentLength) {
      output += contentArr[i] + " ";
      currLen += contentArr[i].length + 1; 
      i++; 
    }
    return output + Constants.seeMoreContentPrompt; 
  }

  // build title in note crd
  Widget _buildTitle(BuildContext context) {
    return Align(child: Text(
      '${widget.note.title}', 
      style: Theme.of(context).textTheme.headline3),
      alignment: Alignment.topLeft,
    );
  }

  // build main content in note card
  Widget _buildContent(BuildContext context) {
    return Align(child: Text(
      '${_createContentPreview(widget.note.content)}',
      style: Theme.of(context).textTheme.bodyText2),
      alignment: Alignment.centerLeft
    );
  }

  // build date in note card
  Widget _buildDate(BuildContext context) {
    return Align(child: Text(
      DateTime.now().day.toString()), 
      alignment: Alignment.bottomLeft
    ); 
  }
  
  @override
  Widget build(BuildContext context) {
    print(widget.note.content.length);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.only(
        top: Constants.noteCardTopPadding, 
        left: Constants.noteCardSidePadding,
        right: Constants.noteCardSidePadding,
        bottom: Constants.noteCardTopPadding
      ),
      child: Column(children: <Widget>[
        _buildTitle(context),
        _buildContent(context),
        _buildDate(context), 
        // Text('${note.dateCreated.toIso8601String()}', style: Theme.of(context).textTheme.bodyText2),
      ],)
    );
  }
}
