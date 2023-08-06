import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thinkpad/src/view/create_note.dart';

import '../../model/note.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem({super.key,required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateNoteView(note: note,)));
          },
          padding: EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 2,
          child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 2)
                  ),
              child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          note.title,
                          style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                        Text(
                          note.description,
                          style: GoogleFonts.poppins(fontSize: 16),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                  
                ],
              )
              ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
