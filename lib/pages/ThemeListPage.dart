import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeListPage extends StatefulWidget {
  static const String routeName = '/chooseTheme';

  const ThemeListPage({
    Key? key,
  }) : super(key: key);

  @override
  _ThemeListPageState createState() => _ThemeListPageState();
}

class _ThemeListPageState extends State<ThemeListPage> {
  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    String title = AppLocalizations.of(context)!.chooseTheme;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(title),
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          backgroundColor: RainbowTheme.secondary,
          leading: BackButton(onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.settings);
          }),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: ListTile(
                      onTap: () {
                        setState(() {
                          RainbowTheme.primary_1 = Colors.blueAccent;
                          RainbowTheme.variant = Colors.blue;
                          RainbowTheme.primary_2 = Colors.blueAccent;
                          SharedPreferences.getInstance().then(
                            (prefs) {
                              prefs.setInt('theme', 1);
                            },
                          );
                        });
                      },
                      title: Text(
                        AppLocalizations.of(context)!.ocean,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blueAccent,
                      ))),
              Container(
                  alignment: Alignment.center,
                  child: ListTile(
                      onTap: () {
                        setState(() {
                          RainbowTheme.primary_1 = Colors.green;
                          RainbowTheme.variant = Colors.greenAccent;
                          RainbowTheme.primary_2 = Colors.lightGreen;
                          SharedPreferences.getInstance().then(
                            (prefs) {
                              prefs.setInt('theme', 2);
                            },
                          );
                        });
                      },
                      title: Text(
                        AppLocalizations.of(context)!.earth,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                      ))),
              Container(
                  alignment: Alignment.center,
                  child: ListTile(
                      onTap: () {
                        setState(() {
                          RainbowTheme.primary_1 = Colors.black;
                          RainbowTheme.variant = Colors.grey;
                          RainbowTheme.primary_2 = Colors.black;
                          SharedPreferences.getInstance().then(
                            (prefs) {
                              prefs.setInt('theme', 3);
                            },
                          );
                        });
                      },
                      title: Text(
                        AppLocalizations.of(context)!.dark,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                      ))),
              Container(
                  alignment: Alignment.center,
                  child: ListTile(
                      onTap: () {
                        setState(() {
                          RainbowTheme.primary_1 = Colors.purpleAccent;
                          RainbowTheme.variant = Colors.purple;
                          RainbowTheme.primary_2 = Colors.deepPurple;
                          SharedPreferences.getInstance().then(
                            (prefs) {
                              prefs.setInt('theme', 4);
                            },
                          );
                        });
                      },
                      title: Text(
                        AppLocalizations.of(context)!.orchid,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.purpleAccent,
                      ))),
            ],
          ),
        ));
  }
}
