import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/sections_model.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  static SectionsCubit get(context) => BlocProvider.of(context);

  //variables
  SectionsModel? data;

  //methods
  void fetchSectionsData() {
    DioHelper.getData(
      url: sectionEndPoint,
      token: token,
    ).then((jsonData) {
      data = SectionsModel.fromJson(jsonData.data);
      emit(SectionsDataFetched());
    }).catchError((e) {
      emit(SectionsDataFetched());
    });
  }
}
