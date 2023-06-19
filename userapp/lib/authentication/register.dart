import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';
import '../mainScreens/home_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/error_dialog.dart';
import '../widgets/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void formValidation() async {
    if (_formkey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (c) {
          return LoadingDialog(
            message: "Creating Account",
          );
        },
      );

      try {
        UserCredential auth =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        User? currentUser = auth.user;

        if (currentUser != null) {
          await saveDataToFirestore(currentUser);
          Navigator.pop(context);
          Route newRoute = MaterialPageRoute(builder: (c) => HomeScreen());
          Navigator.pushReplacement(context, newRoute);
        }
      } catch (error) {
        String errorMessage = error.toString();
        if (error is FirebaseAuthException) {
          errorMessage = error.message!;
        }
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: errorMessage,
            );
          },
        );
      }
    }
  }

  Future<void> saveDataToFirestore(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .set({
      "uid": currentUser.uid,
      "email": currentUser.email,
      "name": nameController.text.trim(),
      "status": "approved",
      "userCart": ["garbageValue"],
    });

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email.toString());
    await sharedPreferences!.setString("name", nameController.text.trim());
    await sharedPreferences!.setStringList("userCart", ["garbageValue"]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 15),
            const SizedBox(height: 10),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextField(
                    data: Icons.person,
                    controller: nameController,
                    hintText: "Nama",
                    isObsecre: false,
                  ),
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
                  CustomTextField(
                    data: Icons.lock,
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    isObsecre: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            ElevatedButton(
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffFC7115),
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
