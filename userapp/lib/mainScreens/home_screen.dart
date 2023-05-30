import 'package:flutter/material.dart';
import 'package:userapp/widgets/my_drawer.dart';

import '../authentication/auth_screen.dart';
import '../global/global.dart';

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
        automaticallyImplyLeading: true,
        title: Text(
          sharedPreferences!.getString("name")!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
          ),
          onPressed: () {
            firebaseAuth.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const AuthScreen()));
            });
          },
        ),
      ),
    );
  }
}
