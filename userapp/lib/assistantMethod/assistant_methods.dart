import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:userapp/global/global.dart';

addItemToCart(String? foodItemID, BuildContext context, int itemCounter) {
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  tempList!
      .add(foodItemID! + ":itemCounter"); // 56557657:7 --> format ke database

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
