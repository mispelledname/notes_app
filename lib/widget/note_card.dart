import 'package:flutter/material.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/services/format_date_time.dart';
import 'package:notesapp/util/colour.dart';
import 'package:notesapp/util/constants.dart';
import 'package:notesapp/util/locator.dart';

/// Note Card
/// 
/// Displays the title, content and date created of a Note in the 
/// main section of the home screen. 
/// 
class NoteCard extends StatefulWidget {
  final Note note; 

  NoteCard({@required this.note});
  
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  FormatDateTime _formatDateTime = locator<FormatDateTime>();
  
  /// Create Content Preview
  /// 
  /// Truncates the content at an appropriate place, if it exceeds the 
  /// maximum number of characters in the preview display. 
  String _createContentPreview(String content) {
    int i = 0; 
    int currLen = 0; 
    String output = "";
    List<String> contentArr = content.split(" ");

    while (i < contentArr.length && currLen < Constants.maxContentLength) {
      output += contentArr[i] + " ";
      currLen += contentArr[i].length + 1; 
      i++; 
    }
    return output + Constants.seeMoreContentPrompt; 
  }

  /// build title in Note Card 
  Widget _buildTitle(BuildContext context) {
    return Align(child: Text(
      '${widget.note.title}', 
      style: Theme.of(context).textTheme.headline3),
      alignment: Alignment.topLeft,
    );
  }

  /// build main content in note card
  Widget _buildContent(BuildContext context) {
    return Align(child: Text(
      '${_createContentPreview(widget.note.content)}',
      style: Theme.of(context).textTheme.bodyText2),
      alignment: Alignment.centerLeft
    );
  }

  /// build date in note card
  Widget _buildDate(BuildContext context) {
    return Align(child: Text(
      _formatDateTime.fullString(DateTime.now())),
      alignment: Alignment.bottomLeft
    ); 
  }
  
  /// build Note Card 
  @override
  Widget build(BuildContext context) {
    return Container(
      
      // Aesthetics 
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

      // Content Display 
      child: Column(children: <Widget>[
        // title 
        _buildTitle(context),
        // content
        _buildContent(context),
        // date 
        _buildDate(context), 
      ],)
    );
  }
}
