import 'package:flutter/material.dart';
import 'package:sampleapp/backend/models/UserModel.dart';
import '../routes/routes.dart';
import '../theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);
  static const String _imageUrl = "assets/images/rainbow.png";
  @override
  Widget build(BuildContext context) {
    if (LoggedInUser.role != null) {
      return createDrawer(context);
    }
    return createAllUsersDrawer(context);
  }

  Widget createDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: RainbowTheme.secondary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createHeader(),
          // createUserName(),
          createDrawerItem(
            icon: Icons.calendar_month_outlined,
            text: AppLocalizations.of(context)!.calender,
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.calendar),
          ),
          createDrawerItem(
            icon: Icons.mail_outline,
            text: AppLocalizations.of(context)!.mail,
            onTap: () => Navigator.pushReplacementNamed(context, Routes.mail),
          ),
          createDrawerItem(
            icon: Icons.event_outlined,
            text: AppLocalizations.of(context)!.events,
            onTap: () => Navigator.pushReplacementNamed(context, Routes.events),
          ),
          createDrawerItem(
            icon: Icons.person_outline_outlined,
            text: AppLocalizations.of(context)!.profile,
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.profile),
          ),
          createDrawerItem(
            icon: Icons.settings_outlined,
            text: AppLocalizations.of(context)!.settings,
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.settings),
          ),
          createDrawerItem(
              icon: Icons.logout_outlined,
              text: AppLocalizations.of(context)!.logout,
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
          // createUserName(),
          createDrawerItem(
            icon: Icons.calendar_month_outlined,
            text: AppLocalizations.of(context)!.calender,
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.calendar),
          ),
          createDrawerItem(
            icon: Icons.mail_outline,
            text: AppLocalizations.of(context)!.mail,
            onTap: () => Navigator.pushReplacementNamed(context, Routes.mail),
          ),
          createDrawerItem(
            icon: Icons.calendar_month_outlined,
            text: AppLocalizations.of(context)!.events,
            onTap: () => Navigator.pushReplacementNamed(context, Routes.events),
          ),
          createDrawerItem(
            icon: Icons.person_outline,
            text: AppLocalizations.of(context)!.profile,
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.profile),
          ),
          createDrawerItem(
            icon: Icons.settings_outlined,
            text: AppLocalizations.of(context)!.settings,
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.settings),
          ),
          createDrawerItem(
            icon: Icons.logout_outlined,
            text: AppLocalizations.of(context)!.logout,
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.login);
            },
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.blueGrey,
            child: const Text(
              'created by BLU-DOTS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            height: 50,
          )
        ],
      ),
    );
  }

  Widget createHeader() {
    String username, name, lastName;
    if (LoggedInUser.loggedInUser?.firstName == null) {
      username = "User";
      name = "User";
      lastName = "";
    } else {
      username = LoggedInUser.loggedInUser?.username ?? "";
      name = LoggedInUser.loggedInUser?.firstName ?? "";
      lastName = LoggedInUser.loggedInUser?.lastName ?? "";
    }

    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [RainbowTheme.primary_1, RainbowTheme.primary_2],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ),
        accountName: Text(
          username,
          style: const TextStyle(
              fontSize: 22,
              height: 2,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
        accountEmail: Text(
          name + " " + lastName,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),
        ),
        currentAccountPicture:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage('assets/images/blank-profile.png'),
            backgroundColor: RainbowTheme.primary_1,
          ),
        ]));
  }

  Widget createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(children: <Widget>[
        Icon(
          icon,
          color: RainbowTheme.primary_1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text,
              style: TextStyle(
                  color: RainbowTheme.primary_1,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal)),
        )
      ]),
      onTap: onTap,
    );
  }
}
