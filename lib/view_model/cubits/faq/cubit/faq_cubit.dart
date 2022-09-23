import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/faq_model.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());
  static FaqCubit get(context) => BlocProvider.of(context);

  FAQModel? data;
  void getFaqData() {
    DioHelper.getData(
      url: faqEndPoint,
      token: token,
    ).then((jsonData) {
      data = FAQModel.fromJson(jsonData.data);
      emit(FaqDataFetched());
    }).catchError((e) {
      emit(FaqDataFailed());
    });
  }
}
