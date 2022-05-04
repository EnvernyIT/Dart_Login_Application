import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sampleapp/pages/theme/theme.dart';

class InboxFieldObject extends StatelessWidget {
  final String? picture;
  final String from;
  final String body;
  final DateTime? date;
  final bool read;
  final bool star;
  final Function()? onStarTap;

  const InboxFieldObject({
    Key? key,
    this.picture,
    required this.from,
    required this.body,
    this.date,
    required this.read,
    required this.star,
    required this.onStarTap,
  }) : super(key: key);

  Widget inboxListObject(BuildContext context) {
    var monthFormat = DateFormat("MMM");
    var dayFormat = DateFormat("dd");
    return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: RainbowTheme.secondary,
          borderRadius: BorderRadius.circular(15.0),
        ),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Row(children: [
              const SizedBox(
                width: 5.0,
              ),
              CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    AssetImage(picture ?? 'assets/images/blank-profile.png'),
                backgroundColor: Colors.blueAccent,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 240,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            from,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: read == false
                                  ? FontWeight.w900
                                  : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            (() {
                              if (body.length >= 35) {
                                return body.substring(0, 35) + ".......";
                              }
                              return body;
                            }()),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      monthFormat.format(date!).toString() +
                          " " +
                          dayFormat.format(date!).toString(),
                      style: TextStyle(
                        fontWeight:
                            read == false ? FontWeight.w900 : FontWeight.normal,
                      )),
                  const SizedBox(
                    width: 12.0,
                  ),
                  InkWell(
                    child: star == true
                        ? Icon(
                            Icons.star,
                            color: star == true
                                ? Colors.yellow[800]
                                : Colors.black,
                          )
                        : Icon(Icons.star_outline),
                    onTap: onStarTap,
                  )
                ],
              ),
              // const Divider(
              //   height: 20,
              //   color: Colors.black,
              // )
            ])
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return inboxListObject(context);
  }
}

class OutboxFieldObject extends StatelessWidget {
  final String? picture;
  final String to;
  final String body;
  final DateTime? date;
  final bool? star;
  final Function()? onStarTap;

  const OutboxFieldObject(
      {Key? key,
      this.picture,
      required this.to,
      required this.body,
      this.date,
      this.star,
      required this.onStarTap})
      : super(key: key);

  Widget outboxListObject() {
    var monthFormat = DateFormat("MMM");
    var dayFormat = DateFormat("dd");
    return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: RainbowTheme.secondary,
          borderRadius: BorderRadius.circular(15.0),
        ),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Row(children: [
              const SizedBox(
                width: 5.0,
              ),
              CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    AssetImage(picture ?? 'assets/images/blank-profile.png'),
                backgroundColor: Colors.blueAccent,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 240,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            to,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            (() {
                              if (body != null) {
                                if (body.length >= 35) {
                                  return body.substring(0, 35) + ".......";
                                }
                                return body;
                              }
                              return "Mail is Empty. Check Connection";
                            }()),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                width: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(monthFormat.format(date!).toString() +
                          " " +
                          dayFormat.format(date!).toString()),
                      const SizedBox(
                        width: 12.0,
                      ),
                      InkWell(
                        child: star == true
                            ? Icon(
                                Icons.star,
                                color: star == true
                                    ? Colors.yellow[800]
                                    : Colors.black,
                              )
                            : Icon(Icons.star_outline),
                        onTap: onStarTap,
                      )
                    ],
                  )
                ],
              ),
              const Divider(
                height: 20,
                color: Colors.black,
              )
            ])
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return outboxListObject();
  }
}
