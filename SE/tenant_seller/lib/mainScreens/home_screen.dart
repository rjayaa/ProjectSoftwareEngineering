import 'package:flutter/material.dart';
import 'package:tenant_seller/authentication/auth_screen.dart';
import 'package:tenant_seller/global/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xff272727),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          sharedPreferences!.getString("name")!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
          ),
          onPressed: () {
            firebaseAuth.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => const AuthScreen()));
          },
        ),
      ),
    );
  }
}
