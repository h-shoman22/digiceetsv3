// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/HomePage.dart';
import 'package:main/firebase_options.dart';
import 'package:main/login_page.dart';

class AuthenticationRepository {
  // Define your authentication-related methods here
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthenticationRepository());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigiCeets',
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)),
      home: HomePage(),
    );
  }
}
