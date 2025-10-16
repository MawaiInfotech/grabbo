
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabbo/pages/login_page.dart';
import 'package:grabbo/prefbox.dart';
import 'package:grabbo/routes/app_routes.dart';
import 'package:grabbo/services/homepage_service.dart';
import 'package:grabbo/services/login_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

Future<void> main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive
    .init(directory.path);
   // ..registerAdapter(LoginModelAdapter());

  await Hive.openBox(kPrefsBox);
  await Hive.openBox('login_box');
  await Hive.openBox('userFrom');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // your app theme color
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MultiProvider(
    providers: [
      Provider<LoginService>(create: (_) => LoginService()),
      Provider<HomepageService>(create: (_) => HomepageService()),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getRoutes(context),
      theme: ThemeData(
        useMaterial3: false
      ),
      home: const LoginPage(),
    );
  }
}
