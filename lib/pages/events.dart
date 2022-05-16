import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/bottomMailBar.dart';

class EventsPage extends StatefulWidget {
  static const String routeName = '/events';

  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    String title = AppLocalizations.of(context)!.events;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(title),
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          backgroundColor: RainbowTheme.secondary,
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              TextButton.icon(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Routes.list),
                icon: const Icon(
                  Icons.list,
                  size: 24,
                ),
                label: Text(AppLocalizations.of(context)!.list),
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
