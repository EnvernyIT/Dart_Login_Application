import 'package:flutter/material.dart';

class BottomMailBar extends StatelessWidget {
  const BottomMailBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createBottomBar(context);
  }

  Widget createBottomBar(BuildContext context) {
    return Container(
      height: 55.0,
      color: Colors.white,
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.inbox,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.outbox, color: Colors.blueAccent),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.drafts, color: Colors.blueAccent),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.blueAccent),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
