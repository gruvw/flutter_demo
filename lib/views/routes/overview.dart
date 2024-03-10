import "package:flutter/material.dart";
import "package:flutter_demo/models/todo_model.dart";
import "package:flutter_demo/viewmodels/todo_viewmodel.dart";
import "package:flutter_demo/views/components/todo_view.dart";
import "package:flutter_demo/views/navigation/routes.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nanoid/nanoid.dart";

class OverviewPage extends HookConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Todo Flutter"),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: [
          for (final todo in todos) TodoView(item: todo),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key("new"),
        onPressed: () {
          final newItem = TodoItem(
            id: nanoid(),
            name: "",
            dueDate: DateTime.now(),
            status: TodoStatus.created,
          );
          ref.read(todosProvider.notifier).addTodo(newItem);
          Navigator.pushNamed(
            context,
            Routes.editTodo.name,
            arguments: newItem.id,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
