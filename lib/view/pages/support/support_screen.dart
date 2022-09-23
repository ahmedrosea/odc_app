import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/default_form_field.dart';
import 'package:flutter_app/view/components/default_form_field_area.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController complainController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Support',
          style: GoogleFonts.poppins(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DefaultFormField(
                  hintText: 'Name',
                  prefex: Icon(Icons.person),
                  controller: nameController,
                  validationText: 'name can\'t be empty',
                ),
                SizedBox(
                  height: 20.0,
                ),
                DefaultFormField(
                  hintText: 'E-Mail',
                  prefex: Icon(Icons.mail),
                  controller: emailController,
                  validationText: 'email can\'t be empty',
                ),
                SizedBox(
                  height: 20.0,
                ),
                DefaultFormFieldArea(
                  hintText: 'What\'s making you unhappy?',
                  maxLines: 7,
                  controller: complainController,
                  validationText: 'you must type your problem',
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
