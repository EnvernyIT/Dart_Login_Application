import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sampleapp/pages/mailpage.dart';
import 'package:sampleapp/pages/theme/theme.dart';

import '../backend/models/MailModel.dart';
import 'calenderPage.dart';
import 'components/bottomReadMailBar.dart';

class ReadMailPage extends StatefulWidget {
  static const String routeName = '/readMail';
  static const String title = 'Mail';
  InboxObject? io;
  ReadMailPage({Key? key, this.io})
      : super(
          key: key,
        );

  @override
  _ReadMailPageState createState() => _ReadMailPageState();
}

class _ReadMailPageState extends State<ReadMailPage> {
  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Mail"),
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          backgroundColor: RainbowTheme.secondary,
          leading: BackButton(
            color: RainbowTheme.primary_1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MailPage()),
              );
            },
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.star_border_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.delete_outline)),
          ],
        ),
        bottomNavigationBar: const BottomReadMailBar(),
        backgroundColor: const Color.fromARGB(255, 218, 218, 218),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5.0,
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(widget.io?.picture ??
                          'assets/images/blank-profile.png'),
                      backgroundColor: Colors.blueAccent,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      widget.io?.from ?? "Sender",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.yMMMEd()
                              .format(widget.io?.send ?? DateTime.now())
                              .toString(),
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.io?.body ?? "No message to show!",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        overflow: TextOverflow.fade),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
