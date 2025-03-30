import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/screens/notes/notes_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesList extends StatelessWidget {

  @override
  Widget build(BuildContext inContext) {
    return ScopedModel<NotesModel>(model: notesModel, child:
    ScopedModelDescendant(
        builder: (BuildContext inContext, _, NotesModel inModel) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(

              onPressed: () {
              notesModel.entityBeingEdited = NoteModel();
              notesModel.setColor(null);
              notesModel.setStackIndex(1);
              },
              child: Icon(Icons.add, color: Colors.white,),
            ),
            body: ListView.builder(
              itemCount: notesModel.entityList.length,
              itemBuilder: (BuildContext inContext, int inIndex) {
                NoteModel note = notesModel.entityList[inIndex];
                Color color = Colors.white;
                switch (note.color) {
                  case "red" : color = Colors.red; break;
                  case "green" : color = Colors.green; break;
                  case "blue" : color = Colors.blue; break;
                  case "yellow" : color = Colors.yellow; break;
                  case "grey" : color = Colors.grey; break;
                  case "purple" : color = Colors.purple; break;
                }
              },
            ),
          );
        })
    );
  }
}