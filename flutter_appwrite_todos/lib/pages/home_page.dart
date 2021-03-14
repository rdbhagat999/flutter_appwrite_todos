import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  static const HomePageId = 'home_page_id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(AppConstants.SearchPageURL);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(AppConstants.ProfilePageURL);
            },
          ),
        ],
      ),
      body: GetX<TodoController>(
        builder: (_todoCtrl) {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: _todoCtrl.todos.length,
            itemBuilder: (BuildContext context, int index) {
              Todo todo = _todoCtrl?.todos[index];
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(todo?.todoTitle),
                subtitle: Text(
                  DateFormat.yMMMEd().format(todo?.createdAt),
                ),
                trailing: Checkbox(
                  value: todo?.isCompleted,
                  onChanged: (bool val) {},
                ),
                onTap: () {
                  Get.toNamed(
                    AppConstants.TodoDetailsPageURL,
                    parameters: {
                      "todoId": todo?.id,
                    },
                    arguments: {"todo": todo},
                  );
                },
                onLongPress: () async {
                  await _todoCtrl?.editTodo(title: todo?.id, todo: todo);
                },
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        splashColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(AppConstants.AddTodoPageURL);
        },
      ),
    );
  }
}
