import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';
import 'package:sampleapp/pages/routes/routes.dart';

import 'components/bottomBar.dart';

class EventsPage extends StatefulWidget {
  static const String routeName = '/events';
  static const String title = 'Events';

  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
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
        bottomNavigationBar: const BottomBar(),
        drawer: NavBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Events"),
              TextButton.icon(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Routes.list),
                icon: const Icon(
                  Icons.list,
                  size: 24,
                ),
                label: const Text("List"),
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
