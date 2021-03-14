import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';
import 'routes/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // smartManagement: SmartManagement.onlyBuilder,
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Appwrite Todos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: Get.deviceLocale,
      initialRoute: AppConstants.RootURL,
      getPages: getPages,
    );
  }
}
