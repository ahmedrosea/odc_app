import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/exams_model.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  static ExamsCubit get(context) => BlocProvider.of(context);

  //variables
  ExamsModel? data;

  //methods
  void fetchExamsData() async {
    await DioHelper.getData(
      url: examsEndPoint,
      token: token,
    ).then((jsonData) {
      data = ExamsModel.fromJson(jsonData.data);
      emit(ExamsFetched());
    }).catchError((e) {
      throw 'there is an error of type $e';
    });
  }
}
