// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    String title = AppLocalizations.of(context)!.settings;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(title),
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
                child: Text(
                  AppLocalizations.of(context)!.style,
                  style: TextStyle(
                    color: RainbowTheme.primary_1,
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
                  title: Text(
                    AppLocalizations.of(context)!.theme,
                    style: const TextStyle(
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
                  title: Text(
                    AppLocalizations.of(context)!.fontFamily,
                    style: const TextStyle(
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
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.language);
                  },
                  title: Text(
                    AppLocalizations.of(context)!.language,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15),
                height: 30,
                child: Text(
                  AppLocalizations.of(context)!.profile,
                  style: TextStyle(
                    color: RainbowTheme.primary_1,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
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
