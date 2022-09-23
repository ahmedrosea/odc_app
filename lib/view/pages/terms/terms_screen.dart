import 'package:flutter/material.dart';
import 'package:flutter_app/view_model/cubits/terms/cubit/terms_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getTermsData(),
      child: BlocConsumer<TermsCubit, TermsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          TermsCubit myCubit = TermsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 26,
                  color: Colors.orange,
                ),
              ),
              centerTitle: true,
              title: const Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            body: myCubit.terms == null
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5.0,
                      color: Colors.orange,
                    ),
                  )
                : SingleChildScrollView(
                    child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: HtmlWidget(myCubit.terms!.data!.terms.toString()),
                    ),
                  )),
          );
        },
      ),
    );
  }
}
