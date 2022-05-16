import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sampleapp/backend/models/UserModel.dart';
import 'package:sampleapp/pages/components/IconText.dart';
import 'package:sampleapp/pages/components/TitleText.dart';
import 'package:sampleapp/pages/components/navbar.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../backend/models/UserModel.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String firstName, lastName;
    if (LoggedInUser.loggedInUser != null) {
      firstName = LoggedInUser.loggedInUser?.firstName ?? "";
      lastName = LoggedInUser.loggedInUser?.lastName ?? "";
    } else {
      firstName = "User";
      lastName = "";
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.profile),
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          backgroundColor: RainbowTheme.secondary,
        ),
        drawer: NavBar(),
        body: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () {
                          _editProfileImage(context);
                        },
                        child: CircleAvatar(
                          radius: 65.0,
                          child: const CircleAvatar(
                              radius: 60.0,
                              backgroundImage: AssetImage(
                                  'assets/images/blank-profile.png')),
                          backgroundColor: RainbowTheme.primary_1,
                        ))),
                IconTextField(
                  title: AppLocalizations.of(context)!.username,
                  firstWord: LoggedInUser.loggedInUser?.username ?? "",
                  icon: Icons.edit_outlined,
                  iconColor: Colors.black,
                  textColor: Colors.black,
                ),
                SizedBox(
                  height: 8,
                ),
                IconTextField(
                  title: AppLocalizations.of(context)!.name,
                  firstWord: LoggedInUser.loggedInUser?.firstName ?? "",
                  secondWord: LoggedInUser.loggedInUser?.lastName ?? "",
                  icon: Icons.edit_outlined,
                  iconColor: Colors.black,
                  textColor: Colors.black,
                ),
              ],
            )));
  }

  @override
  void initState() {
    super.initState();
  }

  void _editProfileImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 25.0,
                    color: RainbowTheme.primary_1,
                  )),
                  InkWell(
                      child: Icon(
                    Icons.photo_album_outlined,
                    size: 25.0,
                    color: RainbowTheme.primary_1,
                  )),
                  InkWell(
                      child: Icon(
                    Icons.delete_outline,
                    size: 25.0,
                    color: RainbowTheme.primary_1,
                  )),
                ],
              ),
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ));
        });
  }
}
