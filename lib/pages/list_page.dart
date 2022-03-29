import 'package:flutter/material.dart';
import 'package:sampleapp/backend/data/list_items.dart';
import 'package:sampleapp/backend/model/employeeModel.dart';

import '../backend/model/list_item_widget.dart';

class ListPage extends StatefulWidget {
  static const String routeName = '/list';
  static const String title = 'List';

  const ListPage({
    Key? key,
  }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<EmployeeModel> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return listBuild(context);
  }

  Widget listBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("List"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                ListItemWidget(
                    item: items[index],
                    animation: animation,
                    onClicked: () => removeItem(index)),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: insertItem(),
      ),
    );
  }

  removeItem(int index) {
    final removeditem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(
          item: removeditem, animation: animation, onClicked: () {}),
      duration: const Duration(milliseconds: 300),
    );
  }

  insertItem() {
    final newIndex = 1;
    final newItem = EmployeeModel(firstName: "Bryan", lastName: "Juscelino");

    items.insert(newIndex, newItem);
    listKey.currentState?.insertItem(
      newIndex,
      duration: const Duration(milliseconds: 400),
    );
  }
}
