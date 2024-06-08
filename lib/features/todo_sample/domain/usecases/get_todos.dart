import 'package:dartz/dartz.dart';
import 'package:loyal_member/core/error/failures.dart';
import 'package:loyal_member/core/usecases/usecase.dart';
import 'package:loyal_member/features/todo_sample/domain/entities/todo.dart';
import 'package:loyal_member/features/todo_sample/domain/repositories/todo_repository.dart';

class GetTodos implements UseCase<List<Todo>, NoParams> {
  final TodoRepository repository;

  GetTodos(this.repository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await repository.getTodos();
  }
}