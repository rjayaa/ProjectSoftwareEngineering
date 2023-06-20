import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:userapp/assistantMethods/asisstant_methods.dart';
import 'package:userapp/global/global.dart';
import 'package:userapp/mainScreens/home_screen.dart';

class PlaceOrderScreen extends StatefulWidget {
  String? locationID;
  double? totalAmount;
  String? sellerUID;

  PlaceOrderScreen({this.locationID, this.totalAmount, this.sellerUID});
  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  String orderId = DateTime.now().millisecondsSinceEpoch.toString();

  addOrderDetails() {
    writeOrderDetailsForUser({
      "locationID": widget.locationID,
      "totalAmount": widget.totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails": "Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    });

    writeOrderDetailsForSeller({
      "locationID": widget.locationID,
      "totalAmount": widget.totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails": "Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    }).whenComplete(() {
      clearCartNow(context);
      setState(() {
        orderId = "";
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        Fluttertoast.showToast(msg: "Order has been placed successfully.");
      });
    });
  }

  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(sharedPreferences!.getString("uid"))
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  Future writeOrderDetailsForSeller(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff272727),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                "Place Order",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffFC7115), padding: EdgeInsets.all(15)),
              onPressed: () {
                addOrderDetails();
              },
            )
          ],
        ),
      ),
    );
  }
}
