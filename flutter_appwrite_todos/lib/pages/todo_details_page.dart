import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodoDetailsPage extends StatelessWidget {
  static const TodoDetailsPageId = 'todo_details_page_id';
  final TodoController _todoCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    String todoId = Get.parameters["todoId"];
    Todo todo = Get.arguments["todo"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
        actions: [],
      ),
      body: todoId.isNotEmpty
          ? ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text('Id: ${todo?.id}'),
                SizedBox(
                  height: 10.0,
                ),
                Text('UserId: ${todo?.userId}'),
                SizedBox(
                  height: 10.0,
                ),
                Text('Created: ' + DateFormat.yMMMEd().format(todo?.createdAt)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todo: ${todo?.todoTitle}'),
                SizedBox(
                  height: 10.0,
                ),
                Text('Completed: ${todo?.isCompleted}'),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    await _todoCtrl?.editTodo(title: todo?.id, todo: todo);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  child: Text('Delete'),
                  onPressed: () async {
                    await _todoCtrl?.deleteTodo(
                      todoId: todo?.id,
                    );
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            )
          : Container(),
    );
  }
}
