import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/default_title.dart';
import 'package:flutter_app/view/components/home/custom_home_card.dart';
import 'package:flutter_app/view/pages/sections/sections_screen.dart';
import 'package:flutter_app/view/pages/settings/settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DefaultTitle(fontSize: 21.0),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    customHomeCard(
                        icon: 'lecture',
                        text: 'Lectures',
                        context: context,
                        targetScreen: 'lecturesScreen'),
                    customHomeCard(
                        icon: 'sections',
                        text: 'Sections',
                        context: context,
                        targetScreen: 'sectionsScreen'),
                    customHomeCard(
                        icon: 'midterm',
                        text: 'Midterms',
                        context: context,
                        targetScreen: 'midtermsScreen'),
                    customHomeCard(
                        icon: 'final',
                        text: 'Finals',
                        context: context,
                        targetScreen: 'finalsScreen'),
                    customHomeCard(
                        icon: 'event',
                        text: 'Events',
                        context: context,
                        targetScreen: 'calenderScreen'),
                    customHomeCard(
                        icon: 'notes',
                        text: 'Notes',
                        context: context,
                        targetScreen: 'notesScreen'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
