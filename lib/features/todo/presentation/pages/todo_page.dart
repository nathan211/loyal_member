import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyal_member/features/todo/presentation/controllers/todo_controller.dart';
import 'package:loyal_member/core/custom_widgets/custom_list/custom_list.dart';
import 'package:loyal_member/features/todo/domain/entities/todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.todos.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Widget> todoWidgets = controller.todos.map((Todo todo) {
          return ListTile(
            title: Text(todo.title),
            trailing: Icon(
              todo.completed ? Icons.check : Icons.close,
              color: todo.completed ? Colors.green : Colors.red,
            ),
          );
        }).toList();

        return CustomList(
          onLoadMore: controller.loadMore,
          hasMore: controller.hasMore.value,
          children: todoWidgets,
        );
      }),
    );
  }
}