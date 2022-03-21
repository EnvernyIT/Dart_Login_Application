import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class EventsPage extends StatefulWidget {
  static const String routeName = '/events';

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
        ),
        drawer: NavBar(),
        body: const Center(child: Text("Events")));
  }

  @override
  void initState() {
    super.initState();
  }
}
