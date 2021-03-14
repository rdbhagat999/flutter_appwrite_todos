import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatelessWidget {
  static const LoginPageId = 'login_page_id';
  final _formKey = GlobalKey<FormState>();
  final LoginPageController _loginPageCtrl = Get.find();
  final AuthController _authCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                    decoration: InputDecoration(labelText: 'Email'),
                    autofocus: true,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (!EmailValidator.validate(value.trim())) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: _loginPageCtrl.emailFieldController,
                    onSaved: (email) {
                      _loginPageCtrl.emailFieldController.text = email;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: _loginPageCtrl.passwordFieldController,
                    onSaved: (password) {
                      _loginPageCtrl.passwordFieldController.text = password;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          await _authCtrl.login(
                            email: _loginPageCtrl.emailFieldController.text,
                            password:
                                _loginPageCtrl.passwordFieldController.text,
                          );
                        }
                      },
                      child: Text('Sign In'),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    child: Text('Not Registered? Click here'),
                    onPressed: () {
                      Get.offAllNamed(AppConstants.RegisterPageURL);
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
