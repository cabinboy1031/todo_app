/// The to-do list itself. Should be the first screen seen on startup.
import 'package:flutter/material.dart';

class ListItem {
  var _name = "";
  var _body = "";
  var _tags = [];
  bool selected = false;

  ListItem(String name, String body) {
    _name = name;
    _body = _body;
  }

  void addTag(String tag) {
    _tags.add(tag);
  }

  void removeTag(String tag) {
    _tags.remove(tag);
  }

  bool hasTag(String tag) {
    return _tags.contains(tag);
  }

  String get getName => _name;
  String get getBody => _body;
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<ListItem> data = <ListItem>[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, int index) {
              return CheckboxListTile(
                value: data[index].selected,
                onChanged: (value) {
                  setState(() {
                    data[index].selected = !data[index].selected;
                  });
                },
                title: Text(data[index].getName),
              );
            }).build(context),
        Container(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to new page
              setState(() {
                data.add(ListItem("Test", "Test Body"));
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
