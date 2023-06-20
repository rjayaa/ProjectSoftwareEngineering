import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/assistantMethods/cart_item_counter.dart';
import 'package:userapp/assistantMethods/location_changer.dart';
import 'package:userapp/assistantMethods/total_amount.dart';
import 'package:userapp/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'global/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => CartItemCounter()),
        ChangeNotifierProvider(create: (c) => TotalAmount()),
        ChangeNotifierProvider(create: (c) => LocationChanger()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Makan Bang?',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFC7115)),
          useMaterial3: true,
        ),
        home: const MySplashScreen(),
      ),
    );
  }
}
