// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sampleapp/backend/services/storage.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';
  final SecureStorage ss = SecureStorage();

  SettingsPage({Key? key}) : super(key: key);

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

    init();
  }

  Future init() async {
    final url = await SecureStorage.readSecureURLData() ?? '';
    final username = await SecureStorage.readSecureUsernameData() ?? '';
    final password = await SecureStorage.readSecurePasswordData() ?? '';

    print(url);
    print(username);
    print(password);
  }
}
