import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/theme.dart';

class IconTextField extends StatelessWidget {
  String title;
  String firstWord;
  String? secondWord;
  String? thirdWord;
  IconData? icon;
  Color? textColor;
  Color? iconColor;

  IconTextField({
    Key? key,
    required this.title,
    required this.firstWord,
    this.secondWord,
    this.thirdWord,
    this.icon,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Container(
            padding: const EdgeInsets.all(0),
            child: Text(
              title + ": ",
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black, fontSize: 19.0),
            )),
        SizedBox(
          width: 20,
        ),
        Container(
            padding: const EdgeInsets.all(0),
            child: Text(
              firstWord,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black, fontSize: 19.0),
            )),
        const SizedBox(
          width: 5,
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              secondWord ?? "",
              textAlign: TextAlign.left,
              style: TextStyle(color: textColor, fontSize: 19.0),
            ))
      ]),
      icon != null
          ? InkWell(
              radius: 25,
              onTap: () {},
              child: CircleAvatar(
                child: Icon(
                  icon,
                  color: iconColor,
                ),
                backgroundColor: RainbowTheme.secondary,
              ))
          : Container(),
    ]);
  }
}
