/// The to-do list itself. Should be the first screen seen on startup.
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var todoList = <String>[];

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
                        TextButton(onPressed: () {}, child: const Icon(Icons.menu)),
                        TextButton(onPressed: () {}, child: const Icon(Icons.edit)),
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
