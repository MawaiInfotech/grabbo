import 'package:flutter/material.dart';
import 'package:grabbo/pages/login_page.dart';
import 'package:grabbo/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getRoutes(context),
      theme: ThemeData(
        useMaterial3: false
     //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}
