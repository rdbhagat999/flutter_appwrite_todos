import 'package:appwrite/appwrite.dart';
import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:flutter_appwrite_todos/services/services.dart';

class TodoService {
  BaseService _base = BaseService();
  static const _collectionId = '60487251a1f6a';

  Future<List<Todo>> fetchTodosAction({String query = ''}) async {
    try {
      Response response = await _base.db.listDocuments(
        collectionId: TodoService._collectionId,
        search: query,
        orderField: "updated_at",
        orderType: OrderType.desc,
      );

      if (response.statusCode == 200) {
        if (response.data["sum"] < 1) {
          return List<Todo>();
        }
        return List<Todo>.from(
          response.data["documents"].map(
            (doc) => Todo.fromJson(doc),
          ),
        );
      }
      return List<Todo>();
    } catch (e) {
      print('fetchTodosAction exception');
      print(e.message);
      throw (e);
    }
  }

  Future<Todo> addTodoAction({String title, String userId}) async {
    try {
      Todo todo = Todo();
      todo.userId = userId;
      todo.todoTitle = title;
      todo.isCompleted = false;
      todo.createdAt = DateTime.now();
      todo.updatedAt = DateTime.now();

      Response response = await _base.db.createDocument(
        collectionId: TodoService._collectionId,
        data: todo.toJson(),
        read: ["user:${todo.userId}"],
        write: ["user:${todo.userId}"],
      );

      if (response.statusCode == 201) {
        return Todo.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('addTodoAction exception');
      print(e.message);
      throw (e);
    }
  }

  Future<Todo> editTodoAction({String title, Todo todo}) async {
    try {
      todo.isCompleted = !todo.isCompleted;
      todo.updatedAt = DateTime.now();

      Response response = await _base.db.updateDocument(
        collectionId: TodoService._collectionId,
        documentId: todo.id,
        data: todo.toJson(),
        read: ["user:${todo.userId}"],
        write: ["user:${todo.userId}"],
      );

      if (response.statusCode == 200) {
        return Todo.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('editTodoAction exception');
      print(e.message);
      throw (e);
    }
  }

  Future<String> deleteTodoAction({String todoId}) async {
    try {
      Response response = await _base.db.deleteDocument(
        collectionId: TodoService._collectionId,
        documentId: todoId,
      );
      print('deleted: ${response.statusCode}');
      if (response.statusCode == 204) {
        return todoId;
      }
      return null;
    } catch (e) {
      print('deleteTodoAction exception');
      print(e.message);
      throw (e);
    }
  }
}
