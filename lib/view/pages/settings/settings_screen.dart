import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  List<String> listNames = [
    'FAQ',
    'Terms & Conditions',
    'Our Partners',
    'Support',
    'Log out',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: null,
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, 'faqScreen');
                      break;
                    case 1:
                      Navigator.pushNamed(context, 'termsScreen');
                      break;
                    case 3:
                      Navigator.pushNamed(context, 'supportScreen');
                      break;
                    case 4:
                      Navigator.pushReplacementNamed(context, 'loginScreen');
                      break;
                    default:
                      Navigator.pushNamed(context, 'termsScreen');
                      break;
                  }
                },
                child: ListTile(
                  title: Text(
                    listNames[index],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 22.0,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              );
            },
            itemCount: 5));
  }
}
