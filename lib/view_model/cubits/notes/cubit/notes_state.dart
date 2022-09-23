part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesAddedSuccess extends NotesState {}

class NotesAddedFailed extends NotesState {}

class NotesFetchedSuccess extends NotesState {}

class NotesFetchedFailed extends NotesState {}
