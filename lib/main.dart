import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/loginView.dart';
import 'locator.dart';
void main() {
  MyLoctor();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter login demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView());
  }
}
