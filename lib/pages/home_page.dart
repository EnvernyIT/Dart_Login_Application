import 'package:flutter/material.dart';
import 'package:sampleapp/backend/model/user_model.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: NavBar(),
        body: Center(child: Text("Home")));
  }

  @override
  void initState() {
    super.initState();
  }
}
