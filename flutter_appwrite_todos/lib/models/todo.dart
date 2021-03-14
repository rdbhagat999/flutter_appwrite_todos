class Todo {
  String id;
  String collection;
  Permissions permissions;
  String userId;
  String todoTitle;
  bool isCompleted;
  DateTime createdAt;
  DateTime updatedAt;

  Todo(
      {this.id,
      this.collection,
      this.permissions,
      this.userId,
      this.todoTitle,
      this.isCompleted,
      this.createdAt,
      this.updatedAt});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    collection = json['\$collection'];
    permissions = json['\$permissions'] != null
        ? new Permissions.fromJson(json['\$permissions'])
        : null;
    userId = json['user_id'];
    todoTitle = json['todo_title'];
    isCompleted = json['is_completed'];
    createdAt = DateTime.fromMillisecondsSinceEpoch(json['created_at']);
    updatedAt = DateTime.fromMillisecondsSinceEpoch(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['\$id'] = this.id;
    // data['\$collection'] = this.collection;
    // if (this.permissions != null) {
    //   data['\$permissions'] = this.permissions.toJson();
    // }
    data['user_id'] = this.userId;
    data['todo_title'] = this.todoTitle;
    data['is_completed'] = this.isCompleted;
    data['created_at'] = this.createdAt.millisecondsSinceEpoch;
    data['updated_at'] = this.updatedAt.millisecondsSinceEpoch;
    return data;
  }
}

class Permissions {
  List<String> read;
  List<String> write;

  Permissions({this.read, this.write});

  Permissions.fromJson(Map<String, dynamic> json) {
    read = json['read'].cast<String>();
    write = json['write'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read'] = this.read;
    data['write'] = this.write;
    return data;
  }
}
