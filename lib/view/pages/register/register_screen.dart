import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/default_form_field.dart';
import 'package:flutter_app/view/pages/login/login_screen.dart';
import 'package:flutter_app/view_model/cubits/register/cubit/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String gender = 'Male';
  String university = 'AUC';
  String grade = 'Grade 1';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          RegisterCubit myCubit = RegisterCubit.get(context);
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
                            Text('Orange',
                                style: GoogleFonts.poppins(
                                  color: Colors.orange,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
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
                        const SizedBox(
                          height: 60.0,
                        ),
                        Text('Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DefaultFormField(
                          hintText: 'Name',
                          controller: nameController,
                          validationText: 'name can\'t be empty',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          hintText: 'E-mail',
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
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          hintText: 'Password',
                          isPassword: true,
                          controller: repeatPasswordController,
                          validationText: 'password can\'t be empty',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          hintText: 'Phone Number',
                          controller: phoneNumberController,
                          validationText: 'phone number can\'t be empty',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.orange, width: 1.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Center(
                                    child: DropdownButton(
                                      underline: const SizedBox(),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      value: gender,
                                      items: [
                                        DropdownMenuItem(
                                          child: const Text('Male'),
                                          value: 'Male',
                                          onTap: () {
                                            gender = 'Male';
                                            setState(() {});
                                          },
                                        ),
                                        DropdownMenuItem(
                                          child: const Text('Female'),
                                          value: 'Female',
                                          onTap: () {
                                            gender = 'Female';
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'University',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.orange, width: 1.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    value: university,
                                    items: [
                                      DropdownMenuItem(
                                        child: const Text('AUC'),
                                        value: 'AUC',
                                        onTap: () {
                                          university = 'AUC';
                                          setState(() {});
                                        },
                                      ),
                                      DropdownMenuItem(
                                        child: const Text('Benha'),
                                        value: 'Benha',
                                        onTap: () {
                                          university = 'Benha';
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grade',
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange, width: 1.0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  value: grade,
                                  items: [
                                    DropdownMenuItem(
                                      child: const Text('Grade 1'),
                                      value: 'Grade 1',
                                      onTap: () {
                                        grade = 'Grade 1';
                                        setState(() {});
                                      },
                                    ),
                                    DropdownMenuItem(
                                      child: const Text('Grade 2'),
                                      value: 'Grade 2',
                                      onTap: () {
                                        grade = 'Grade 2';
                                        setState(() {});
                                      },
                                    ),
                                    DropdownMenuItem(
                                      child: const Text('Grade 3'),
                                      value: 'Grade 3',
                                      onTap: () {
                                        grade = 'Grade 3';
                                        setState(() {});
                                      },
                                    ),
                                    DropdownMenuItem(
                                      child: const Text('Grade 4'),
                                      value: 'Grade 4',
                                      onTap: () {
                                        grade = 'Grade 4';
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                myCubit.register(
                                  name: nameController.text.toString(),
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString(),
                                  repeatPassword:
                                      repeatPasswordController.text.toString(),
                                  phoneNumber:
                                      phoneNumberController.text.toString(),
                                  gender: gender,
                                  university: university,
                                  grade: grade,
                                  context: context,
                                );
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: myCubit.isRegistering == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Sign Up',
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
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: const [
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
                              style: TextStyle(
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
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'loginScreen');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'Login',
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
