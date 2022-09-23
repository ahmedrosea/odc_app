import 'package:flutter/material.dart';
import 'package:flutter_app/view/pages/home/home_screen.dart';
import 'package:flutter_app/view/pages/news/news_screen.dart';
import 'package:flutter_app/view/pages/settings/settings_screen.dart';
import 'package:flutter_app/view_model/cubits/navbar/cubit/navbar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: BlocConsumer<NavbarCubit, NavbarState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NavbarCubit myCubit = NavbarCubit.get(context);
          int selectedIndex = myCubit.selectedIndex;
          Widget selectedScreen = myCubit.screens[selectedIndex];
          return Scaffold(
            body: selectedScreen,
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: GNav(
                selectedIndex: selectedIndex,
                backgroundColor: Colors.white,
                rippleColor: Colors.black,
                hoverColor: Colors.orange,
                haptic: true,
                tabBorderRadius: 15,
                tabShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8)
                ],
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 400),
                gap: 8,
                color: Colors.black,
                activeColor: Colors.orange,
                iconSize: 24,
                tabBackgroundColor: Colors.grey.withOpacity(0.1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.newspaper,
                    text: 'News',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                onTabChange: (index) {
                  print(index);
                  myCubit.changeState(newIndex: index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
