import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loyal_member/features/todo/domain/entities/todo.dart';
import 'package:loyal_member/features/todo/domain/usecases/get_todos.dart';
import 'package:dartz/dartz.dart';
import 'package:loyal_member/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var isLoading = true.obs;
  final GetTodos getTodos;

  TodoController(this.getTodos);

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    try {
      isLoading(true);
      Either<Failure, List<Todo>> result = await getTodos(NoParams());
      result.fold(
            (failure) {
          // handle failure
          debugPrint(failure.message);
        },
            (todoList) {
          todos.assignAll(todoList);
        },
      );
    } finally {
      isLoading(false);
    }
  }
}