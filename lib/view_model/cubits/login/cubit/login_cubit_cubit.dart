import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/login_model.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';
import 'package:flutter_app/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  static LoginCubitCubit get(context) => BlocProvider.of(context);

//variables
  LoginModel? user;
  String? message;
  bool isLogging = false;
//fuc
  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    isLogging = true;
    emit(LoginCubitLoginProgress());
    DioHelper.postData(url: loginEndPoint, data: {
      'email': email,
      'password': password,
    }).then((response) {
      user = LoginModel.fromJson(response.data);
      message = user!.message.toString();
      isLogging = false;
      emit(LoginCubitLoginSuccess());

      Navigator.pushReplacementNamed(context, 'navbarScreen');
      print(message);
    }).catchError((e) {
      isLogging = false;
      message = 'Error';
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'There\'s something went wrong while logging !',
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

      emit(LoginCubitLoginError());
    });
  }
}
