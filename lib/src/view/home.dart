import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thinkpad/src/model/note.dart';
import 'package:thinkpad/src/res/string.dart';
import 'package:thinkpad/src/services/local_db.dart';
import 'package:thinkpad/src/view/create_note.dart';
import 'package:thinkpad/src/view/widgets/empty_view.dart';
import 'package:thinkpad/src/view/widgets/notes_grid.dart';
import 'package:thinkpad/src/view/widgets/notes_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool isListView=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.appName,style: GoogleFonts.poppins(
                    fontSize: 24
                  ),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      isListView=!isListView;
                    });
                  }, 
                  icon: Icon(isListView ? Icons.splitscreen_rounded: Icons.grid_view  )),
                ],
              ),
            ),
            // const EmptyView(),
            Expanded(
              child: StreamBuilder<List<Note>>(
                stream: LocalDBService().listenAllNotes(),
                builder: (context, snapshot) {
                  if(snapshot.data==null||snapshot.data!.isEmpty){
                    return const EmptyView();
                  }
                  final notes=snapshot.data!;
                  return AnimatedSwitcher(duration: Duration(milliseconds: 300),
                  child: isListView ? NotesList(notes: notes) : NotesGrid(notes: notes),
                  );
                }
              ),
            ),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateNoteView()));
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          child: const Icon(Icons.add_rounded,color: Colors.black,),
        ),
      ),
    );
  }
}