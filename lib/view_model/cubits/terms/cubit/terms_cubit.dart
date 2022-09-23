import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/terms_model.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());
  static TermsCubit get(context) => BlocProvider.of(context);

  TermsModel? terms;

  void getTermsData() {
    DioHelper.getData(url: termsEndPoint, token: token).then((jsonData) {
      terms = TermsModel.fromJson(jsonData.data);
      print(terms!.code);
      emit(TermsRecievedSuccess());
    }).catchError((e) {
      emit(TermsRecievedSuccess());
    });
  }
}
