class User {
  String id;
  String name;
  int registration;
  int status;
  String email;
  bool emailVerification;
  Prefs prefs;

  User(
      {this.id,
      this.name,
      this.registration,
      this.status,
      this.email,
      this.emailVerification,
      this.prefs});

  User.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    name = json['name'];
    registration = json['registration'];
    status = json['status'];
    email = json['email'];
    emailVerification = json['emailVerification'];
    prefs = json['prefs'] != null ? new Prefs.fromJson(json['prefs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['name'] = this.name;
    data['registration'] = this.registration;
    data['status'] = this.status;
    data['email'] = this.email;
    data['emailVerification'] = this.emailVerification;
    if (this.prefs != null) {
      data['prefs'] = this.prefs.toJson();
    }
    return data;
  }
}

class Prefs {
  Prefs();

  Prefs.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
