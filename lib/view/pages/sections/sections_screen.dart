import 'package:flutter/material.dart';
import 'package:flutter_app/view_model/cubits/lectures/cubit/lectures_cubit.dart';
import 'package:flutter_app/view_model/cubits/sections/cubit/sections_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionsCubit()..fetchSectionsData(),
      child: BlocConsumer<SectionsCubit, SectionsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SectionsCubit myCubit = SectionsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.orangeAccent,
                ),
              ),
              title: const Text(
                'Sections',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_alt,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
            body: myCubit.data == null
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    color: Colors.orange,
                  ))
                : ListView.builder(
                    padding: const EdgeInsets.all(20.0),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 120.0,
                        child: Card(
                          elevation: 3.0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      myCubit.data!.data![index].sectionSubject
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.timer,
                                          size: 20.0,
                                        ),
                                        Text(
                                          '2hrs',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Section Day',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              size: 22.0,
                                            ),
                                            Text(
                                              myCubit.data!.data![index]
                                                  .sectionDate
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Start Time',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.timer_rounded,
                                              size: 22.0,
                                              color: Colors.greenAccent,
                                            ),
                                            Text(
                                              myCubit.data!.data![index]
                                                  .sectionStartTime
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'End Time',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.timer_rounded,
                                              size: 22.0,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              myCubit.data!.data![index]
                                                  .sectionEndTime
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: myCubit.data!.data!.length),
          );
        },
      ),
    );
  }
}
