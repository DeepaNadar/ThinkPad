import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import '../../model/note.dart';
import 'note_grid_item.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({super.key,required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
      itemBuilder: (context,index,animation){
        return NoteGridItem(note:notes[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 3,mainAxisSpacing: 3),
      itemCount: notes.length,
      options: LiveOptions(),
    );
  }
}