import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleText extends StatelessWidget {
  final String title;

  TitleText({
    Key? key,
    required this.title,
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
        const SizedBox(
          width: 5,
        ),
      ])
    ]);
  }
}
