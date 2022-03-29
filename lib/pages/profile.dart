import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  static const String title = "Profile";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Profile"),
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
          backgroundColor: Colors.blueAccent,
        ),
        drawer: NavBar(),
        body: Image.network(
          'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
