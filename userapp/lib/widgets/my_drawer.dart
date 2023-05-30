import 'package:flutter/material.dart';
import 'package:userapp/global/global.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: const Color(0xFFFC7115),
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                "Mau Cari Apa?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
