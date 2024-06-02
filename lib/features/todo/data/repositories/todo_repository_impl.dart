import 'package:dartz/dartz.dart';
import 'package:loyal_member/core/error/failures.dart';
import 'package:loyal_member/features/todo/domain/entities/todo.dart';
import 'package:loyal_member/features/todo/domain/repositories/todo_repository.dart';
import 'package:loyal_member/features/todo/data/data_sources/todo_service.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoService todoService;

  TodoRepositoryImpl(this.todoService);

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final todoModels = await todoService.fetchTodos();
      final todos = todoModels.map((model) => model.toEntity()).toList();
      return Right(todos);
    } catch (e) {
      return Left(ServerFailure('Server error'));
    }
  }
}