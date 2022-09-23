import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/notes/add_notes_form_field.dart';
import 'package:flutter_app/view_model/cubits/notes/cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NotesCubit myCubit = NotesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 26.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Add Note',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 27.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      addNotesFormField(
                        label: 'Title',
                        controller: titleController,
                        validationText: 'title can\'t be empty',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      addNotesFormField(
                        label: 'Date',
                        controller: dateController,
                        validationText: 'date can\'t be empty',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      addNotesFormField(
                        controller: noteController,
                        maxLines: 7,
                        hint: 'Note',
                        validationText: 'note can\'t be empty',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 90.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              myCubit.insertNote(
                                title: titleController.text.toString(),
                                date: dateController.text.toString(),
                                note: noteController.text.toString(),
                              );
                              Navigator.pushReplacementNamed(
                                  context, 'notesScreen');
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            Colors.grey,
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Add',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
