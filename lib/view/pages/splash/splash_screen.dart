import 'package:flutter/material.dart';
import 'package:flutter_app/view/pages/home/home_screen.dart';
import 'package:flutter_app/view_model/cubits/splash/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SplashCubit myCubit = SplashCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Orange',
                        style: GoogleFonts.poppins(
                          color: Colors.orange,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Digital Center',
                        style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  Center(
                    child: LinearPercentIndicator(
                      width: 350,
                      lineHeight: 8.0,
                      onAnimationEnd: () {
                        Navigator.pushReplacementNamed(context, 'loginScreen');
                      },
                      animationDuration: 1000,
                      animation: true,
                      percent: 1,
                      barRadius: const Radius.circular(10.0),
                      backgroundColor: Colors.grey[300],
                      progressColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
