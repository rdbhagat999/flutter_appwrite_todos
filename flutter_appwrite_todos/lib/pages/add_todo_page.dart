import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class AddTodoPage extends StatelessWidget {
  static const AddTodoPageId = 'add_todo_page_id';

  final _formKey = GlobalKey<FormState>();
  final AddTodoPageController _addTodoPageCtrl = Get.find();
  final TodoController _todoCtrl = Get.find();
  final AuthController _authCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Todo'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'This field is required';
                      }

                      return null;
                    },
                    controller: _addTodoPageCtrl.todoTitleFieldController,
                    onSaved: (val) {
                      _addTodoPageCtrl.todoTitleFieldController.text = val;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          await _todoCtrl.addTodo(
                              title: _addTodoPageCtrl
                                  .todoTitleFieldController.text,
                              userId: _authCtrl?.user?.value?.id);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
