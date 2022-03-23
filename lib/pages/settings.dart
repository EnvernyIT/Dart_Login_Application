// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: NavBar(),
        body: const Center(child: Text("Settings")));
  }

  @override
  void initState() {
    super.initState();
  }
}
