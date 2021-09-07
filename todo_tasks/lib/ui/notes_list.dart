import 'package:flutter/material.dart';
import 'package:todo_tasks/models/note.dart';

class NotesList extends StatefulWidget {
  NotesList({Key? key}) : super(key: key);
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    List<Note> notes = <Note>[];
    for (int i = 0; i < 10; i++) {
      notes.add(Note(i, i.toString(), i.toString()));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildNoteTile(notes[index]);
        /*return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('Entry ${entries[index]}')),
        );*/
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
          //color: Colors.white,
          //thickness: 0.0,
          ),
    );
  }

  Widget _buildNoteTile(Note note) {
    return Card(
        elevation: 1.0,
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.description),
          onTap: () {}, // Will use this to open the Note
        ));
  }
}
