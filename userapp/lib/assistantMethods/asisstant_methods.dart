import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:userapp/assistantMethods/cart_item_counter.dart';
import 'package:userapp/global/global.dart';

separateItemIDs() {
  List<String> separateItemIDsList = [], defaultItemList = [];
  int i = 0;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (i; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":");
    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    print("\n This is itemID now = " + getItemId);

    separateItemIDsList.add(getItemId);
  }

  print("\n This is Items List now = ");
  print(separateItemIDsList);

  return separateItemIDsList;
}

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

    Provider.of<CartItemCounter>(context, listen: false)
        .displayCartListItemsNumber();
  });
}

separateItemQuantities() {
  List<int> separateItemQuantityList = [];
  List<String> defaultItemList = [];
  int i = 1;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (i; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();

    List<String> listItemCharacters = item.split(":").toList();

    var quanNumber = int.parse(listItemCharacters[1].toString());
    print("\n Quantity : " + quanNumber.toString());

    separateItemQuantityList.add(quanNumber);
  }

  print("\n This is Items List now = ");
  print(separateItemQuantityList);

  return separateItemQuantityList;
}
