import 'package:flutter/material.dart';
import 'package:flutter_book/misc/constants/hive_boxes_keys.dart';
import 'package:flutter_book/misc/constants/hive_boxes_name.dart';
import 'package:flutter_book/screens/notes/notes_item.dart';
import 'package:flutter_book/screens/notes/notes_list.dart';
import 'package:flutter_book/screens/notes/notes_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Notes extends StatelessWidget {

  const Notes({super.key});


  @override
  Widget build(BuildContext inContext) {
    notesModel.getData(HiveBoxName.notes, HiveBoxesKeys.notesList);
    return ScopedModel<NotesModel>(
        model: notesModel,
        child: ScopedModelDescendant<NotesModel>(
            builder: (BuildContext inContext, _, NotesModel inModel) {
          return IndexedStack(
            index: inModel.stackIndex,
            children: [NotesList(), NotesItem()],
          );
        }));
  }
}
