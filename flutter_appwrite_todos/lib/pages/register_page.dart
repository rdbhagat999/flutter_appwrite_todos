import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static const RegisterPageId = 'register_page_id';
  final _formKey = GlobalKey<FormState>();
  final RegisterPageController _registerPageCtrl = Get.find();
  final AuthController _authCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                    decoration: InputDecoration(labelText: 'Name'),
                    autofocus: true,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                    controller: _registerPageCtrl.nameFieldController,
                    onSaved: (name) {
                      _registerPageCtrl.nameFieldController.text = name;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (!EmailValidator.validate(value.trim())) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: _registerPageCtrl.emailFieldController,
                    onSaved: (email) {
                      _registerPageCtrl.emailFieldController.text = email;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: _registerPageCtrl.passwordFieldController,
                    onChanged: (password) {
                      _registerPageCtrl.passwordFieldController.text = password;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          await _authCtrl.register(
                              name: _registerPageCtrl.nameFieldController.text,
                              email:
                                  _registerPageCtrl.emailFieldController.text,
                              password: _registerPageCtrl
                                  .passwordFieldController.text);
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    child: Text('Already Registered? Click here'),
                    onPressed: () {
                      Get.offAllNamed(AppConstants.LoginPageURL);
                    },
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
