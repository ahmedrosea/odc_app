import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/register_model.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? user;
  String? message;
  bool isRegistering = false;

  void register({
    required String name,
    required String email,
    required String password,
    required String repeatPassword,
    required String phoneNumber,
    required String gender,
    required String university,
    required String grade,
    required BuildContext context,
  }) {
    isRegistering = true;
    emit(RegisterRegistering());
    DioHelper.postData(
      url: registerEndPoint,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'gender': gender == 'male' ? 'm' : 'f',
        'phoneNumber': phoneNumber,
        'universityId': 1,
        'gradeId': 4,
        'roleId': 2,
      },
    ).then((jsonData) {
      user = RegisterModel.fromJson(jsonData.data);
      message = user!.message;
      print(message);
      isRegistering = false;
      Navigator.pushReplacementNamed(context, 'navbarScreen');
      emit(RegisterSuccess());
    }).catchError((e) {
      isRegistering = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'There\'s something went wrong while registering !',
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
      emit(RegisterFailed());
    });
  }
}
