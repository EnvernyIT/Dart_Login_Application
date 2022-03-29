import 'package:flutter/material.dart';
import 'package:sampleapp/backend/model/user_model.dart';
import '../routes/routes.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (LoggedInUser.role != null) {
      return createDrawer(context);
    }
    return createAllUsersDrawer(context);
  }

  Widget createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createHeader(),
          createUserName(),
          createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          createDrawerItem(
            icon: Icons.home,
            text: 'Notes',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.notes),
          ),
          createDrawerItem(
            icon: Icons.home,
            text: 'Events',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.events),
          ),
          createDrawerItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.profile),
          ),
          createDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.settings),
          ),
          createDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () => {
                    Navigator.pushReplacementNamed(context, Routes.login),
                  }),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: const Text('created by BLU-DOTS'),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget createAllUsersDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createHeader(),
          createUserName(),
          createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          createDrawerItem(
            icon: Icons.calendar_month,
            text: 'Events',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.events),
          ),
          createDrawerItem(
            icon: Icons.notes,
            text: 'Notes',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.notes),
          ),
          createDrawerItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.profile),
          ),
          createDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.settings),
          ),
          createDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.login);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: const Text('created by BLU-DOTS'),
            onTap: () {},
          )
        ],
      ),
    );
  }

  SizedBox createUserName() {
    String? lala = "Hello, ";
    if (LoggedInUser.loggedInUser?.firstName == null) {
      lala += 'Hello, User';
    } else {
      lala += LoggedInUser.loggedInUser?.firstName ?? "";
    }

    return SizedBox(
      height: 30,
      child: Stack(children: <Widget>[
        Positioned(
            top: 10,
            // bottom: 2.0,
            left: 30.0,
            child: Text(lala,
                style: const TextStyle(
                    color: Color.fromARGB(255, 5, 102, 182),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]),
    );
  }

  Widget createHeader() {
    String? lala = "Hello, ";
    if (LoggedInUser.loggedInUser?.firstName == null) {
      lala += 'Hello, User';
    } else {
      lala += LoggedInUser.loggedInUser?.firstName ?? "";
    }
    return Container(
        height: 250,
        child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/rainbow.png'))),
          child: Stack(children: const <Widget>[
            Positioned(
                bottom: 2.0,
                left: 30.0,
                child: Text("",
                    style: TextStyle(
                        color: Color.fromARGB(255, 5, 102, 182),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500))),
          ]),
        ));
  }

  Widget createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(children: <Widget>[
        Icon(
          icon,
          color: const Color.fromARGB(255, 5, 102, 182),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text,
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal)),
        )
      ]),
      onTap: onTap,
    );
  }
}
