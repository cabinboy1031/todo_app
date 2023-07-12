/// The to-do list itself. Should be the first screen seen on startup.
import 'package:flutter/material.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  var _list = TodoList();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("TodoList Part."),
            ),
            for (var i = 0; i < 100; i++)
              OutlinedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Expanded(
                      flex: 3,
                      child: Text("Test Item."),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Icon(Icons.menu),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Icon(Icons.edit),
                        ),
                      ],
                    )
                  ],
                ),
                onPressed: () {},
                onLongPress: () {},
              ),
          ],
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}

class ListItem {
  var _name = "";
  var _body = "";
  var _tags = [];

  ListItem(String name, String body) {
    _name = name;
    _body = _body;
  }

  void add_tag(String tag) {
    _tags.add(tag);
  }

  void remove_tag(String tag) {
    _tags.remove(tag);
  }

  bool has_tag(String tag) {
    return _tags.contains(tag);
  }
}

class TodoList {
  List<ListItem> _data = <ListItem>[];

  void add(ListItem item) => _data.add(item);

  void remove(ListItem item) => _data.remove(item);

  ListItem get(int idx) => _data[idx];

  // TODO serialize functions to/from json
}
