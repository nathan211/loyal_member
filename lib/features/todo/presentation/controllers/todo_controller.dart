import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loyal_member/features/todo/domain/entities/todo.dart';
import 'package:loyal_member/features/todo/domain/usecases/get_todos.dart';
import 'package:dartz/dartz.dart';
import 'package:loyal_member/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  var page = 1;
  var hasMore = true.obs;

  final GetTodos getTodos;

  TodoController(this.getTodos);

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    if (isLoading.value || isMoreLoading.value) return;

    isLoading(true);
    try {
      Either<Failure, List<Todo>> result = await getTodos(NoParams());
      result.fold(
            (failure) {
          // handle failure
          debugPrint(failure.message);
        },
            (todoList) {
          todos.assignAll(todoList);
          page++;
        },
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadMore() async {
    if (isLoading.value || isMoreLoading.value || !hasMore.value) return;

    isMoreLoading(true);
    try {
      Either<Failure, List<Todo>> result = await getTodos(NoParams());
      result.fold(
            (failure) {
          // handle failure
          debugPrint(failure.message);
        },
            (todoList) {
          if (todoList.isEmpty) {
            hasMore(false);
          } else {
            todos.addAll(todoList);
            page++;
          }
        },
      );
    } finally {
      isMoreLoading(false);
    }
  }
}