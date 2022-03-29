import 'package:flutter/material.dart';

import 'employeeModel.dart';

class ListItemWidget extends StatelessWidget {
  final EmployeeModel item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const ListItemWidget({
    Key? key,
    required this.item,
    required this.animation,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.ease)),
        child: buildListItem());
  }

  Widget buildListItem() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: const CircleAvatar(
            radius: 32,
          ),
          title: Text(
            item.lastName,
            style: const TextStyle(fontSize: 22, color: Colors.black),
          ),
          subtitle: Text(
            item.firstName,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          trailing: IconButton(
              onPressed: onClicked,
              icon: const Icon(Icons.delete, color: Colors.red, size: 32))),
    );
  }
}
