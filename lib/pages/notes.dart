import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class NotesPage extends StatefulWidget {
  static const String routeName = '/notes';

  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        drawer: NavBar(),
        body: Center(child: Text("Notes")));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
