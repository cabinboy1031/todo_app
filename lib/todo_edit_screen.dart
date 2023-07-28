import 'package:flutter/material.dart';
import 'todo_list.dart';

class TodoEditScreen extends StatefulWidget {
  TodoEditScreen({Key? key}) : super(key: key);

  @override
  State<TodoEditScreen> createState() => _TodoEditScreenState();
}

class _TodoEditScreenState extends State<TodoEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? title = "";
  String? body;
  List<String?> tags = [];

  @override
  Widget build(BuildContext context) {
    var titleFormField = TextFormField(
      decoration: const InputDecoration(
        labelText: "Title:",
        hintText: 'e.x: Do Laundry',
      ),
      validator: (value) {
        return (value == null) ? 'required' : null;
      },
      onSaved: (value) => setState(() {
        title = value;
      }),
    );
    var tagsFormField = TextFormField(
      decoration: const InputDecoration(
        labelText: "Tags(optional):",
        hintText: 'Separate tags by commas...',
      ),
      onSaved: (value) => setState(() {
        for (var i in value!.split(',')) {
          tags.add(i);
        }
      }),
    );

    var bodyFormField = TextFormField(
      decoration: const InputDecoration(
        labelText: "Body(optional):",
        hintText: 'Separate tags by commas...',
      ),
      onSaved: (value) => setState(() {
        body = value;
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit todo details..."),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          titleFormField,
          tagsFormField,
          bodyFormField,
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, null);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var newItem = ListItem(title!, body!.isEmpty ? "" : body!);
                    for (var i in tags) {
                      newItem.addTag(i!);
                    }
                    Navigator.pop(context, newItem);
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
