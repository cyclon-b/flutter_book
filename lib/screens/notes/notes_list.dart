import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/di/di_container.dart';
import 'package:flutter_book/misc/constants/hive_boxes_name.dart';
import 'package:flutter_book/screens/notes/notes_model.dart';
import 'package:flutter_book/services/db_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';

final DbService db = DiContainer.getIt.get<DbService>();

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  Future _deleteNote(BuildContext inContext) async {
    print(inContext);
  }

  @override
  Widget build(BuildContext inContext) {
    return ScopedModel<NotesModel>(
        model: notesModel,
        child: ScopedModelDescendant(
            builder: (BuildContext inContext, _, NotesModel inModel) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                notesModel.entityBeingEdited = NoteModel();
                notesModel.setColor(null);
                notesModel.setStackIndex(1);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: ListView.builder(
              itemCount: notesModel.entityList.length,
              itemBuilder: (BuildContext inContext, int inIndex) {
                NoteModel note = notesModel.entityList[inIndex];
                Color color = Colors.white;
                switch (note.color) {
                  case "red":
                    color = Colors.red;
                    break;
                  case "green":
                    color = Colors.green;
                    break;
                  case "blue":
                    color = Colors.blue;
                    break;
                  case "yellow":
                    color = Colors.yellow;
                    break;
                  case "grey":
                    color = Colors.grey;
                    break;
                  case "purple":
                    color = Colors.purple;
                    break;
                }
                return Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            _deleteNote(context);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 8,
                      color: color,
                      child: ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.content),
                        onTap: () {
                          notesModel.entityBeingEdited =
                              db.readById(HiveBoxName.notes, note.id);
                          notesModel
                              .setColor(notesModel.entityBeingEdited.color);
                          notesModel.setStackIndex(1);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
