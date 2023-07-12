import 'package:flutter/material.dart';
import 'todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var listFlex;
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Expanded(
            flex: constraints.maxWidth > 900 ? 1 : 2,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(),
              ),
              child: const TodoListWidget(),
            ),
          ),
          if (constraints.maxWidth >= 600)
            const Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Title:"),
                        Text("Tags:"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Text("Body:"),
                  ),
                ],
              ),
            ),
        ],
      );
    });
  }
}
