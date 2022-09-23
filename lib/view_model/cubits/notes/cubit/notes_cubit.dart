import 'package:bloc/bloc.dart';
import 'package:flutter_app/model/note_model.dart';
import 'package:flutter_app/view_model/database/local/Sqflite_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  static NotesCubit get(context) => BlocProvider.of(context);

  List<NoteModel> notes = [];
  bool isLoading = false;

  void insertNote(
      {required String title,
      required String date,
      required String note}) async {
    var data = {
      'title': title,
      'date': date,
      'note': note,
    };
    try {
      await SqfliteHelper.addNote(data);
      var allNotes = await SqfliteHelper.getAllNotes();
      for (int i = 0; i < allNotes.length; i++) {
        notes.add(NoteModel.fromMap(allNotes[i]));
      }

      print(notes.length);
      emit(NotesAddedSuccess());
    } catch (e) {
      print(e);
      emit(NotesAddedFailed());
    }
  }

  void fetchNotes() async {
    isLoading = true;
    try {
      var allNotes = await SqfliteHelper.getAllNotes();
      for (int i = 0; i < allNotes.length; i++) {
        notes.add(NoteModel.fromMap(allNotes[i]));
      }
      print(notes.length);
      isLoading = false;
      emit(NotesFetchedSuccess());
    } catch (e) {
      print(e);
      isLoading = false;
      emit(NotesFetchedFailed());
    }
  }

  void deleteAllNotes() async {
    await SqfliteHelper.deleteAllNotes();
  }
}
