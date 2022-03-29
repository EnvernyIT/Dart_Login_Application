import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

import 'components/bottomBar.dart';

class NotesPage extends StatefulWidget {
  static const String routeName = '/notes';
  static const String title = 'Notes';

  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Notes"),
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
        bottomNavigationBar: const BottomBar(),
        body: const Center(child: Text("Notes")));
  }

  @override
  void initState() {
    super.initState();
  }
}
