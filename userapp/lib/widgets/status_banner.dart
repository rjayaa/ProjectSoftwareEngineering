import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:userapp/mainScreens/home_screen.dart';

class StatusBanner extends StatelessWidget {
  final bool? status;
  final String? orderStatus;

  StatusBanner({this.status, this.orderStatus});

  @override
  Widget build(BuildContext context) {
    String message;
    IconData iconData;

    status! ? iconData = Icons.done : iconData = Icons.cancel;
    status! ? message = "Successful" : message = "Unsuccessful";
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff272727),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            orderStatus == "ended"
                ? "Food Delivered $message"
                : "Order Placed $message",
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 8,
            backgroundColor: Color(0xffFC7115),
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
                size: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
