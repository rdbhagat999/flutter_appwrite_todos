import 'package:flutter_appwrite_todos/bindings/add_todo_page_bindings.dart';
import 'package:flutter_appwrite_todos/bindings/bindings.dart';
import 'package:flutter_appwrite_todos/pages/pages.dart';
import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:get/get.dart';

var getPages = [
  //Simple GetPage
  GetPage(
    name: AppConstants.RootURL,
    page: () => LoginPage(),
    binding: LoginPageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.HomePageURL,
    page: () => HomePage(),
    binding: HomePageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.LoginPageURL,
    page: () => LoginPage(),
    binding: LoginPageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.RegisterPageURL,
    page: () => RegisterPage(),
    binding: RegisterPageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.ProfilePageURL,
    page: () => ProfilePage(),
    binding: ProfilePageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.AddTodoPageURL,
    page: () => AddTodoPage(),
    binding: AddTodoPageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.TodoDetailsPageURL,
    page: () => TodoDetailsPage(),
    binding: TodoDetailsPageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
  GetPage(
    name: AppConstants.SearchPageURL,
    page: () => SearchPage(),
    binding: SearchPageBindings(),
    parameter: {},
    middlewares: [],
    children: [],
  ),
];
