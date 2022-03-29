// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';
  static const String title = 'Settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(SettingsPage.title),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
        ),
        drawer: NavBar(),
        body: const Center(child: Text("Settings")));
  }

  @override
  void initState() {
    super.initState();
  }
}
