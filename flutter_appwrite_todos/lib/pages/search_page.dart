import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatelessWidget {
  static const SearchPageId = 'search_page_id';

  final SearchPageController _searchPageCtrl = Get.find();
  final TodoController _todoCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchPageCtrl.searchFieldController,
          autofocus: true,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: 'Search todos',
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (String value) async {
            if (_searchPageCtrl.searchDebounce.isActive ?? false) {
              _searchPageCtrl.searchDebounce.cancel();
            }

            _searchPageCtrl.searchDebounce =
                Timer(const Duration(milliseconds: 500), () async {
              await _todoCtrl.searchTodos(
                query: _searchPageCtrl.searchFieldController.text.trim(),
              );
            });
          },
        ),
      ),
      body: GetX<TodoController>(
        builder: (_todoCtrl) {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: _todoCtrl.searchResultTodos.length,
            itemBuilder: (BuildContext context, int index) {
              Todo todo = _todoCtrl?.searchResultTodos[index];
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
              );
            },
          );
        },
      ),
    );
  }
}
