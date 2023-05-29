import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tenant_seller/splashscreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tenants App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFC7115)),
        useMaterial3: true,
      ),
      home: const MySplashScreen(),
    );
  }
}
