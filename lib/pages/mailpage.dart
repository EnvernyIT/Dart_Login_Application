import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sampleapp/pages/components/navbar.dart';
import 'package:sampleapp/pages/readMail.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';

import 'components/MailObjects.dart';
import '../backend/models/MailModel.dart';
import 'components/bottomMailBar.dart';

class MailPage extends StatefulWidget {
  static const String routeName = '/mail';
  static const String title = 'Mail';

  const MailPage({Key? key}) : super(key: key);

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  static String title = "Inbox";
  static int point = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: RainbowTheme.secondary,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          title: Text(title),
          backgroundColor: RainbowTheme.secondary,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(
                Icons.search,
                color: RainbowTheme.primary_1,
              ),
            )
          ],
        ),
        drawer: NavBar(),
        bottomNavigationBar: Container(
          height: 55.0,
          color: RainbowTheme.secondary,
          child: BottomAppBar(
            color: RainbowTheme.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.inbox_outlined,
                    color: RainbowTheme.primary_1,
                  ),
                  onPressed: () {
                    setState(() {
                      title = "Inbox";
                      point = 0;
                    });
                  },
                ),
                IconButton(
                  icon:
                      Icon(Icons.send_outlined, color: RainbowTheme.primary_1),
                  onPressed: () {
                    setState(() {
                      title = "Sent";
                      point = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.drafts_outlined,
                      color: RainbowTheme.primary_1),
                  onPressed: () {
                    setState(() {
                      title = "Drafts";
                      point = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.star_border_outlined,
                    color: RainbowTheme.primary_1,
                  ),
                  onPressed: () {
                    setState(() {
                      title = "Starred";
                      point = 3;
                    });
                  },
                ),
                IconButton(
                  icon:
                      Icon(Icons.delete_outline, color: RainbowTheme.primary_1),
                  onPressed: () {
                    setState(() {
                      title = "Removed";
                      point = 4;
                    });
                  },
                )
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
            backgroundColor: RainbowTheme.secondary,
            color: RainbowTheme.primary_1,
            onRefresh: refresh,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chooseList().length,
              itemBuilder: (BuildContext context, int index) {
                if (point == 0) {
                  return InkWell(
                      child: InboxFieldObject(
                        picture: inboxItems[index].picture,
                        from: inboxItems[index].from,
                        body: inboxItems[index].body,
                        date: inboxItems[index].send,
                        read: inboxItems[index].read,
                        star: inboxItems[index].star,
                        onStarTap: () {
                          setState(() {
                            InboxObject object = inboxItems[index];
                            object.star =
                                inboxItems[index].star == true ? false : true;
                            inboxItems.contains(inboxItems[index])
                                ? inboxItems[inboxItems.indexWhere(
                                    (v) => v == inboxItems[index])] = object
                                : inboxItems;
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ReadMailPage(io: inboxItems[index])));
                        setState(() {
                          InboxObject object = inboxItems[index];
                          if (inboxItems[index].read == false) {
                            object.read = true;
                          }
                          inboxItems.contains(inboxItems[index])
                              ? inboxItems[inboxItems.indexWhere(
                                  (v) => v == inboxItems[index])] = object
                              : inboxItems;
                        });
                      });
                } else if (point == 1) {
                  return InkWell(
                      onTap: () {},
                      child: OutboxFieldObject(
                        picture: outboxItems[index].picture,
                        to: outboxItems[index].to,
                        body: outboxItems[index].body,
                        date: outboxItems[index].send,
                        star: outboxItems[index].star,
                        onStarTap: () {
                          setState(() {
                            OutboxObject object = outboxItems[index];
                            object.star =
                                outboxItems[index].star == true ? false : true;
                            outboxItems.contains(outboxItems[index])
                                ? outboxItems[outboxItems.indexWhere(
                                    (v) => v == outboxItems[index])] = object
                                : outboxItems;
                          });
                        },
                      ));
                } else if (point == 2) {
                } else if (point == 3) {}
                return const Center();
              },
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.sendMail);
          },
          child: const Icon(Icons.edit),
          backgroundColor: RainbowTheme.primary_1,
          foregroundColor: RainbowTheme.secondary,
          elevation: 12,
        ));
  }

  List<Object> mailItems = [];
  List<Object> chooseList() {
    if (point == 0) {
      return inboxItems;
    } else if (point == 1) {
      return outboxItems;
    } else if (point == 2) {
      return draftItems;
    } else if (point == 4) {
      return [];
    }
    return [];
  }

  Future refresh() async {
    setState(() {
      chooseList();
    });
  }

  static List<InboxObject> inboxItems = <InboxObject>[
    InboxObject(
        id: 1,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: true),
    InboxObject(
        id: 2,
        picture: "assets/images/jim.jfif",
        from: "Kyle@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 3,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: false,
        star: false),
    InboxObject(
        id: 4,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: false,
        star: false),
    InboxObject(
        id: 5,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 6,
        picture: "assets/images/jim.jfif",
        from: "Kyle@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 7,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 8,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 9,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 10,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 11,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 12,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 13,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 14,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 15,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 16,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 17,
        picture: "assets/images/jim.jfif",
        from: "Kyle@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 18,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
    InboxObject(
        id: 19,
        picture: "assets/images/jim.jfif",
        from: "Jeremy@bludots@com",
        body:
            "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
        send: DateTime.now().subtract(const Duration(days: 3)),
        read: true,
        star: false),
  ];

  List<OutboxObject> outboxItems = <OutboxObject>[
    OutboxObject(
        id: 1,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: true),
    OutboxObject(
        id: 2,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 3,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 4,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 5,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: true),
    OutboxObject(
        id: 6,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: true),
    OutboxObject(
        id: 7,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 8,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 9,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 10,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 11,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
    OutboxObject(
        id: 12,
        picture: "assets/images/mary.jfif",
        to: "Chantal@bludots@com",
        body: "Ja, dat voor morgen is geregeld.",
        send: DateTime.now().subtract(const Duration(days: 5)),
        star: false),
  ];

  List<DraftObject> draftItems = [
    DraftObject(
      "Mary@bludots@com",
      "Hahahahaha I love your memes. Keep sending them.",
      DateTime.now().add(const Duration(days: 5)),
    ),
    DraftObject(
      "Jeremy@bludots@com",
      "Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen ",
      DateTime.now().add(const Duration(days: 5)),
    ),
    DraftObject(
      "Kyle@bludots@com",
      "Morning had je dat van gisteren nog geregeld voor ons?",
      DateTime.now().add(const Duration(days: 5)),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
            ))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ));

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      "Chantal@bludots@com",
      "Jeremy@bludots@com",
      "Kyle@bludots@com"
    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
        );
      },
    );
  }
}
