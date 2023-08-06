import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:thinkpad/src/model/note.dart';

import 'note_list_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return AutoAnimatedList<Note>(
        items: notes,
        itemBuilder: (context, note,index,animation) {
          return SizeFadeTransition(
            animation: animation,
            child: NoteListItem(
              note: notes[index],
              ),
          );
        });
  }
}
