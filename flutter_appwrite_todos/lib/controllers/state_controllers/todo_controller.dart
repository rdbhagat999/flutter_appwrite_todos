import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:flutter_appwrite_todos/services/services.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  TodoService _todoService;
  RxList<Todo> todos = List<Todo>().obs;
  RxList<Todo> searchResultTodos = List<Todo>().obs;

  @override
  onInit() {
    super.onInit();
    _todoService = TodoService();
    fetchTodos();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  fetchTodos() async {
    try {
      List<Todo> items = await _todoService.fetchTodosAction();
      todos.clear();
      todos.addAll(items);
    } catch (ex) {
      print('currentProfile exception');
      print(ex);
    }
  }

  searchTodos({String query = ''}) async {
    try {
      List<Todo> items = await _todoService.fetchTodosAction(query: query);
      searchResultTodos.clear();
      searchResultTodos.addAll(items);
    } catch (ex) {
      print('currentProfile exception');
      print(ex);
    }
  }

  Future<void> addTodo({String title, String userId}) async {
    try {
      Todo todo =
          await _todoService.addTodoAction(title: title, userId: userId);
      todos.add(todo);
      todos.sort((Todo a, Todo b) => b.updatedAt.millisecondsSinceEpoch
          .compareTo((a.updatedAt.millisecondsSinceEpoch)));
      Get.back();
    } catch (ex) {
      print('addTodo exception');
      print(ex);
    }
  }

  Future<void> editTodo({String title, Todo todo}) async {
    try {
      Todo updatedTodo =
          await _todoService.editTodoAction(title: title, todo: todo);

      int todoIndex = todos.indexWhere((Todo t) => t.id == updatedTodo.id);
      todos[todoIndex] = updatedTodo;
      todos.sort((Todo a, Todo b) => b.updatedAt.millisecondsSinceEpoch
          .compareTo((a.updatedAt.millisecondsSinceEpoch)));

      Get.back();
    } catch (ex) {
      print('addTodo exception');
      print(ex);
    }
  }

  Future<void> deleteTodo({String todoId}) async {
    try {
      await _todoService.deleteTodoAction(todoId: todoId);
      todos.removeWhere((Todo t) => t.id == todoId);
      Get.back();
    } catch (ex) {
      print('addTodo exception');
      print(ex);
    }
  }
}
