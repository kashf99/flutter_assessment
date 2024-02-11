import 'package:flutter/material.dart';
import 'package:flutter_assessment/views/login_view.dart';
import 'package:get/route_manager.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home:  LoginView(),
    );
  }
}
