import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/lectures_model.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../database/network/dio_helper.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  static LecturesCubit get(context) => BlocProvider.of(context);

  //variables
  LecturesModel? data;

  //methods
  void fetchLecturesData() async {
    await DioHelper.getData(
      url: lectureEndPoint,
      token: token,
    ).then((jsonData) {
      data = LecturesModel.fromJson(jsonData.data);
      emit(LecturesDataFetched());
    }).catchError((e) {
      throw 'there is an error of type $e';
    });
  }
}
