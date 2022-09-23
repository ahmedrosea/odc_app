import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/bottom_nav_bar.dart';
import 'package:flutter_app/view/pages/FAQ/faq_screen.dart';
import 'package:flutter_app/view/pages/calender/calender_screen.dart';
import 'package:flutter_app/view/pages/finals/finals_screen.dart';
import 'package:flutter_app/view/pages/home/home_screen.dart';
import 'package:flutter_app/view/pages/lectures/lectures_screen.dart';
import 'package:flutter_app/view/pages/login/login_screen.dart';
import 'package:flutter_app/view/pages/midterm/midterm_screen.dart';
import 'package:flutter_app/view/pages/news/news_screen.dart';
import 'package:flutter_app/view/pages/notes/add_notes_screen.dart';
import 'package:flutter_app/view/pages/notes/notes_screen.dart';
import 'package:flutter_app/view/pages/register/register_screen.dart';
import 'package:flutter_app/view/pages/sections/sections_screen.dart';
import 'package:flutter_app/view/pages/settings/settings_screen.dart';
import 'package:flutter_app/view/pages/splash/splash_screen.dart';
import 'package:flutter_app/view/pages/support/support_screen.dart';
import 'package:flutter_app/view/pages/terms/terms_screen.dart';
import 'package:flutter_app/view_model/database/network/dio_helper.dart';

void main() async {
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'navbarScreen': (context) => BottomNavBar(),
        'homeScreen': (context) => const HomeScreen(),
        'newsScreen': (context) => const NewsScreen(),
        'settingsScreen': (context) => SettingsScreen(),
        'loginScreen': (context) => LoginScreen(),
        'registerScreen': (context) => RegisterScreen(),
        'lecturesScreen': (context) => const LecturesScreen(),
        'sectionsScreen': (context) => const SectionsScreen(),
        'midtermsScreen': (context) => const MidtermsScreen(),
        'finalsScreen': (context) => const FinalsScreen(),
        'calenderScreen': (context) => const CalenderScreen(),
        'termsScreen': (context) => const TermsScreen(),
        'faqScreen': (context) => const FAQScreen(),
        'supportScreen': (context) => SupportScreen(),
        'notesScreen': (context) => const NotesScreen(),
        'addNotesScreen': (context) => AddNotesScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
