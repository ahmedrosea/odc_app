part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqDataFetched extends FaqState {}

class FaqDataFailed extends FaqState {}
