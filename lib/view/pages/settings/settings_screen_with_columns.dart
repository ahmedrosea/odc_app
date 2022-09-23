import 'package:flutter/material.dart';

class SettingsScreenWithColumns extends StatelessWidget {
  SettingsScreenWithColumns({super.key});
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
      body: Column(
        children: [
          ListTile(
            title: Text(
              'FAQ',
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
          Divider(),
          ListTile(
            title: Text(
              'Terms & Conditions',
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
          Divider(),
          ListTile(
            title: Text(
              'Our Partners',
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
          Divider(),
          ListTile(
            title: Text(
              'Support',
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
          Divider(),
          ListTile(
            title: Text(
              'Log out',
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
          Divider(),
        ],
      ),
    );
  }
}
