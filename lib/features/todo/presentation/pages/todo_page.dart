import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyal_member/features/todo/presentation/controllers/todo_controller.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return ListTile(
              title: Text(todo.title),
              trailing: Icon(
                todo.completed ? Icons.check : Icons.close,
                color: todo.completed ? Colors.green : Colors.red,
              ),
            );
          },
        );
      }),
    );
  }
}