// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';

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
        elevation: 0.5,
        title: const Text(SettingsPage.title),
        foregroundColor: RainbowTheme.primary_1,
        bottomOpacity: 0,
        backgroundColor: RainbowTheme.secondary,
      ),
      drawer: NavBar(),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15),
                height: 30,
                child: const Text(
                  "Style",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
                // height: 40,
                alignment: Alignment.center,
                child: ListTile(
                  style: ListTileStyle.list,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: RainbowTheme.hint,
                  ),
                  iconColor: RainbowTheme.primary_1,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.theme);
                  },
                  title: const Text(
                    "Theme",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )),
            Container(
                height: 52,
                alignment: Alignment.center,
                child: ListTile(
                  style: ListTileStyle.list,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: RainbowTheme.hint,
                  ),
                  iconColor: RainbowTheme.primary_1,
                  onTap: () {},
                  title: const Text(
                    "Color",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )),
            Container(
                height: 52,
                alignment: Alignment.center,
                child: ListTile(
                  style: ListTileStyle.list,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: RainbowTheme.hint,
                  ),
                  iconColor: RainbowTheme.primary_1,
                  onTap: () {},
                  title: const Text(
                    "Font Family",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
