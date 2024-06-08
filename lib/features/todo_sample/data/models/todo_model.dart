import 'package:loyal_member/features/todo_sample/domain/entities/todo.dart';

class TodoModel {
  final int id;
  final String title;
  final bool completed;

  TodoModel({required this.id, required this.title, required this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      completed: completed,
    );
  }
}