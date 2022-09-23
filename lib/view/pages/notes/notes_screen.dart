import 'package:flutter/material.dart';
import 'package:flutter_app/view_model/cubits/notes/cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchNotes(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NotesCubit myCubit = NotesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.orange,
                ),
              ),
              centerTitle: true,
              title: Text(
                'Notes',
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            body: myCubit.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 90.0,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          myCubit.notes[index].title.toString(),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontSize: 22.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          myCubit.notes[index].note.toString(),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          myCubit.notes[index].date.toString(),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.0,
                        );
                      },
                      itemCount: myCubit.notes.length,
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'addNotesScreen');
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
