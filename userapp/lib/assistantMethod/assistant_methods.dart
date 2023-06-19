import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:userapp/global/global.dart';

addItemToCart(String? foodItemId, BuildContext context, int itemCounter) {
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  tempList!
      // ignore: prefer_interpolation_to_compose_strings
      .add(foodItemId! + ":$itemCounter"); // 56557657:7 --> format ke database

  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({
    "userCart": tempList,
  }).then((value) {
    Fluttertoast.showToast(msg: "Item Added Successfully");
    sharedPreferences!.setStringList("userCart", tempList);

    //update the badge
  });
}
