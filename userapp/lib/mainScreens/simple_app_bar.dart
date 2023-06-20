import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  SimpleAppBar({this.bottom});

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Color(0xff272727),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // clearCartNow(context);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (c) => CartScreen()));
        },
      ),
      title: const Text(
        "CanteenCartSunab",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "Poppins",
        ),
      ),
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}