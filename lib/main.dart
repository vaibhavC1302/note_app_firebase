// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app_firebase/pages/homepage.dart';
import 'package:note_app_firebase/pages/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyC7d4P5_5OC_kyGRJfTGyWUI8G1gAGNx8c",
        appId: "1:15865274580:android:37d7201fe0ba82f0615b41",
        messagingSenderId: "15865274580",
        projectId: "notes-app-dd5b4"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.white,
          accentColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xff070706)),
      home: HomePage(),
      // home: FirebaseAuth.instance.currentUser == null
      //     ? const LoginPage()
      //     : const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
