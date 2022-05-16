import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class TaalListPage extends StatefulWidget {
  static const String routeName = '/chooseLanguage';

  const TaalListPage({
    Key? key,
  }) : super(key: key);

  @override
  _TaalListPageState createState() => _TaalListPageState();
}

class _TaalListPageState extends State<TaalListPage> {
  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    String title = AppLocalizations.of(context)!.chooseLanguage;

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
        margin: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {
                    setState(() {
                      MyApp.of(context)?.setLocale(
                          const Locale.fromSubtags(languageCode: 'nl'));
                      SharedPreferences.getInstance().then(
                        (prefs) {
                          prefs.setString('language', "Nederlands");
                        },
                      );
                    });
                  },
                  title: const Text(
                    "Nederlands",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                )),
            Container(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {
                    setState(() {
                      MyApp.of(context)?.setLocale(
                          const Locale.fromSubtags(languageCode: 'en'));
                      SharedPreferences.getInstance().then(
                        (prefs) {
                          prefs.setString('language', "English");
                        },
                      );
                    });
                  },
                  title: const Text(
                    "English",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
