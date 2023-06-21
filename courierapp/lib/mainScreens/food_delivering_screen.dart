import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courierapp/global/global.dart';
import 'package:courierapp/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

class FoodDeliveringScreen extends StatefulWidget {
  String? purchaserId;
  String? purchaseLocation;
  String? purchaseLocationDetail;
  String? sellerId;
  String? getOrderId;

  FoodDeliveringScreen({
    this.purchaserId,
    this.purchaseLocation,
    this.purchaseLocationDetail,
    this.sellerId,
    this.getOrderId,
  });

  @override
  State<FoodDeliveringScreen> createState() => _FoodDeliveringScreenState();
}

class _FoodDeliveringScreenState extends State<FoodDeliveringScreen> {
  confirmFoodHasBeenDelivered(getorderId, sellerId, purchaserId, purchaserFloor,
      purchaserLocationDetail) {
    String riderTotalEarningAmount =
        ((double.parse(prevRiderEarnings)) + (double.parse(perDeliveryAmount)))
            .toString();
    FirebaseFirestore.instance.collection("orders").doc(getorderId).update({
      "status": "done",
      "earnings": perDeliveryAmount, // pay per delivery
    }).then((value) {
      FirebaseFirestore.instance
          .collection("couriers")
          .doc(sharedPreferences!.getString("uid"))
          .update({
        "earnings": riderTotalEarningAmount, //total earnings amount of rider
      });
    }).then((value) {
      FirebaseFirestore.instance
          .collection("sellers")
          .doc(widget.sellerId)
          .update({
        "earnings":
            (double.parse(orderTotalAmount) + (double.parse(prevEarnings)))
                .toString(), //total earnings amount of seller
      });
    }).then((value) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(purchaserId)
          .collection("orders")
          .doc(getorderId)
          .update({
        "status": "done",
        "riderUID": sharedPreferences!.getString("uid"),
      });
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => const MySplashScreen(),
      ),
    );
  }

  String orderTotalAmount = "";
  getOrderTotalAmount() {
    FirebaseFirestore.instance
        .collection("orders")
        .doc(widget.getOrderId)
        .get()
        .then((snap) {
      orderTotalAmount = snap.data()!["totalAmount"].toString();
      widget.sellerId = snap.data()!["sellerUID"].toString();
    }).then((value) {
      getSellerData();
    });
  }

  getSellerData() {
    FirebaseFirestore.instance
        .collection("sellers")
        .doc(widget.sellerId)
        .get()
        .then((snap) {
      prevEarnings = snap.data()!["earnings"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getOrderTotalAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF272727),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              //to do
            },
            child: Center(
              child: Text(
                "Courier Otiway",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  confirmFoodHasBeenDelivered(
                    widget.getOrderId,
                    widget.sellerId,
                    widget.purchaserId,
                    widget.purchaseLocation,
                    widget.purchaseLocationDetail,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFC7115),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: MediaQuery.of(context).size.width - 125,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Order has been Delivered - Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
