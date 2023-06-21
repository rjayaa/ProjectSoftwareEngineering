import 'package:courierapp/authentication/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: const Color(0xff1E1E1E),
          automaticallyImplyLeading: false,
          title: RichText(
            text: const TextSpan(
              text: 'CanteenCart',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "Poppins",
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sunib',
                  style: TextStyle(
                    color: Color(0xFFFC7115),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.black),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.white),
                text: "Sign Up",
              ),
            ],
            indicatorColor: Color(0xffFC7115),
            labelColor: Color(0xffFC7115),
            indicatorWeight: 3,
          ),
        ),
        body: Container(
          color: const Color.fromARGB(237, 30, 30, 30),
          child: const TabBarView(
            children: [
              LoginScreen(),
              SignUpScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
