import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/default_form_field.dart';
import 'package:flutter_app/view/pages/register/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubits/login/cubit/login_cubit_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubitCubit(),
      child: BlocConsumer<LoginCubitCubit, LoginCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LoginCubitCubit mycubit = LoginCubitCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Orange',
                              style: GoogleFonts.poppins(
                                color: Colors.orange,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Digital Center',
                              style: GoogleFonts.poppins(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          hintText: 'E-Mail',
                          controller: emailController,
                          validationText: 'email can\'t be empty',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          hintText: 'Password',
                          isPassword: true,
                          controller: passwordController,
                          validationText: 'password can\'t be empty',
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                mycubit.login(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString(),
                                  context: context,
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: mycubit.isLogging == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.orange),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'OR',
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 1.0,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'registerScreen');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 3.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
