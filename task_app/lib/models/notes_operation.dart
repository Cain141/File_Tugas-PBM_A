import 'package:flutter/foundation.dart';
import 'package:task_app/models/note.dart';

class NotesOperation with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get getNotes => _notes;

  void addNewNote(String title, String description) {
    Note note = Note(
      title: title,
      description: description,
    );
    _notes.add(note);
    notifyListeners();
  }
}
