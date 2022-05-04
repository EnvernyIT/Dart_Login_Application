import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';

class ThemeListPage extends StatefulWidget {
  static const String routeName = '/chooseTheme';
  static const String title = 'Choose Themes';

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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(ThemeListPage.title),
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
                        RainbowTheme(0);
                      },
                      title: const Text(
                        "Ocean",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blueAccent,
                      ))),
              Container(
                  alignment: Alignment.center,
                  child: ListTile(
                      onTap: () {
                        RainbowTheme(1);
                      },
                      title: const Text(
                        "Earth",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                      ))),
            ],
          ),
        ));
  }
}
