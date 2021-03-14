import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class BaseService extends GetxService {
  Client _client;
  Account _account;
  Database _db;
  Storage _storage;

  BaseService() {
    super.onInit();
    _init();
  }

  _init() {
    _client = Client();
    _client
        .setEndpoint(AppConstants.apiEndPoint) // Your Appwrite Endpoint
        .setProject(AppConstants.projectId) // Your project ID
        .setSelfSigned(); // Remove in production

    _account = Account(_client);
    _db = Database(_client);
    _storage = Storage(_client);
  }

  Client get client {
    return _client;
  }

  Account get account {
    return _account;
  }

  Database get db {
    return _db;
  }

  Storage get storage {
    return _storage;
  }
}
