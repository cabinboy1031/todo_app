import 'package:flutter/material.dart';
import './todo_edit_screen.dart';

class ListItem {
  var _name = "";
  var _body = "";
  final _tags = [];
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

  Future<void> _navigateAndAddNewItem(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => TodoEditScreen()),
    );

    if (!mounted) return;

    if (result != null) {
      setState(() {
        data.add(result);
      });
    }
  }

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  _navigateAndAddNewItem(context);
                }),
          ),
        ),
      ],
    );
  }
}
