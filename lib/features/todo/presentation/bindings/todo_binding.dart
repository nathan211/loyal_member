import 'package:get/get.dart';
import 'package:loyal_member/features/todo/data/data_sources/todo_service.dart';
import 'package:loyal_member/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:loyal_member/features/todo/domain/usecases/get_todos.dart';
import 'package:loyal_member/features/todo/presentation/controllers/todo_controller.dart';
import 'package:loyal_member/features/todo/domain/repositories/todo_repository.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoService>(() => TodoService());
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(Get.find()));
    Get.lazyPut<GetTodos>(() => GetTodos(Get.find()));
    Get.lazyPut<TodoController>(() => TodoController(Get.find()));
  }
}