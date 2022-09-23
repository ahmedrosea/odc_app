part of 'exams_cubit.dart';

@immutable
abstract class ExamsState {}

class ExamsInitial extends ExamsState {}

class ExamsFetched extends ExamsState {}
