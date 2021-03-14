import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  static const ProfilePageId = 'profile_page_id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: GetX<AuthController>(
        builder: (_authCtrl) {
          return _authCtrl.isLoggedIn.isTrue
              ? ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    Obx(
                      () => Text('Name: ${_authCtrl?.user?.value?.name}'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => Text('Email: ${_authCtrl?.user?.value?.email}'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => Text(
                          'Verified: ${_authCtrl?.user?.value?.emailVerification}'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      child: Text('Logout'),
                      onPressed: () async {
                        await _authCtrl.logout();
                      },
                    )
                  ],
                )
              : Text('Please login to continue');
        },
      ),
    );
  }
}
