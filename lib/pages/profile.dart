import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/navbar.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        drawer: NavBar(),
        body: Center(child: Text("Profile")));
  }

  @override
  void initState() {
    super.initState();
  }
}
