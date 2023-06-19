import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';
import '../mainScreens/home_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/error_dialog.dart';
import '../widgets/loading_dialog.dart';
import 'auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // login
      loginNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please write email/password..",
            );
          });
    }
  }

  loginNow() async {
    showDialog(
      context: context,
      builder: (c) {
        return LoadingDialog(
          message: "Checking Credentials",
        );
      },
    );
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: error.message,
          );
        },
      );
    });

    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!);
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid) // ngecek uidnya ada apa engga di database
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        // kalo datanya ada
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!.setString("email", snapshot.data()!["email"]);
        await sharedPreferences!.setString("name", snapshot.data()!["name"]);

        List<String> userCartList = snapshot.data()!["userCart"];
        sharedPreferences!.setStringList("userCart", userCartList);

        firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      } else {
        // kalo datanya gaada di lempar lagi ke authscreen
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));
        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: "This user does not exist!",
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    data: Icons.email,
                    controller: emailController,
                    hintText: "Email",
                    isObsecre: false,
                  ),
                  CustomTextField(
                    data: Icons.lock,
                    controller: passwordController,
                    hintText: "Password",
                    isObsecre: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFC7115),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              ),
              onPressed: () {
                formValidation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
