import 'package:flutter/material.dart';
import 'package:flutter_app/view_model/cubits/faq/cubit/faq_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getFaqData(),
      child: BlocConsumer<FaqCubit, FaqState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          FaqCubit myCubit = FaqCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'FAQ',
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.orange,
                ),
              ),
            ),
            body: myCubit.data == null
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    color: Colors.orange,
                  ))
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          HtmlWidget(
                            myCubit.data!.data![0].question.toString(),
                            textStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          HtmlWidget(
                            myCubit.data!.data![0].answer.toString(),
                            textStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
