import 'package:dio/dio.dart';
import 'package:loyal_member/features/todo/data/models/todo_model.dart';
import 'package:loyal_member/core/network/dio_client.dart';

class TodoService {
  final Dio _dio = DioClient().client;

  Future<List<TodoModel>> fetchTodos() async {
    try {
      final response = await _dio.get('todos');
      final List<dynamic> data = response.data;
      return data.map((json) => TodoModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load todos');
    }
  }
}