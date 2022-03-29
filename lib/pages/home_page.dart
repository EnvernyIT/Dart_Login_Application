import 'package:flutter/material.dart';

import 'components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/home';
  static const String title = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
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
              // backgroundColor: Colors.blueAccent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlue],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
              ),
              bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home"),
                  Tab(icon: Icon(Icons.mail), text: "Mail"),
                  Tab(icon: Icon(Icons.task), text: "Tasks"),
                  Tab(icon: Icon(Icons.file_copy_sharp), text: "Reports"),
                ],
              ),
              elevation: 10,
              titleSpacing: 4,
            ),
            drawer: NavBar(),
            body: const Center(child: Text("Home"))));
  }

  @override
  void initState() {
    super.initState();
  }
}
