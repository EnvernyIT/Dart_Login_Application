import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BottomReadMailBar extends StatelessWidget {
  const BottomReadMailBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createBottomBar(context);
  }

  Widget createBottomBar(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.white,
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon:
                  Icon(Icons.reply_all_outlined, color: RainbowTheme.primary_1),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.reply_outlined, color: RainbowTheme.primary_1),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.forward, color: RainbowTheme.primary_1),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
