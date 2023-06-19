import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:userapp/global/global.dart';

addItemToCart(String? foodItemId, BuildContext context, int itemCounter) {
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  // tempList!.add("${foodItemId!}:$itemCounter");
  tempList!.add(foodItemId! + ":$itemCounter");

  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({
    "userCart": tempList,
  }).then((value) {
    Fluttertoast.showToast(msg: "Item Added Successfully.");
    sharedPreferences!.setStringList("userCart", tempList);
  });
}
