import 'package:flutter/material.dart';
import 'package:all_to_do_docs_app/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:all_to_do_docs_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: LoginPage(),
    );
  }
}
