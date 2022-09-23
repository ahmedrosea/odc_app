import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/pages/home/home_screen.dart';
import 'package:flutter_app/view/pages/news/news_screen.dart';
import 'package:flutter_app/view/pages/settings/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarInitial());
  static NavbarCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const NewsScreen(),
    SettingsScreen(),
  ];
  int selectedIndex = 0;

  void changeState({required int newIndex}) {
    selectedIndex = newIndex;
    emit(NavbarChangeState());
  }
}
