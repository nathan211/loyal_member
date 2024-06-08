import 'package:dartz/dartz.dart';
import 'package:loyal_member/core/error/failures.dart';
import 'package:loyal_member/features/todo_sample/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}