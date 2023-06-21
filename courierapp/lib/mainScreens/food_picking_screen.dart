import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'food_delivering_screen.dart';

class FoodPickingScreen extends StatefulWidget {
  final String? purchaserId;
  final String? purchaseLocation;
  final String? purchaseLocationDetail;
  final String? sellerId;
  final String? getOrderId;

  const FoodPickingScreen({
    this.purchaserId,
    this.purchaseLocation,
    this.purchaseLocationDetail,
    this.sellerId,
    this.getOrderId,
  });

  @override
  State<FoodPickingScreen> createState() => _FoodPickingScreenState();
}

class _FoodPickingScreenState extends State<FoodPickingScreen> {
  @override
  void initState() {
    super.initState();
  }

  confirmFoodHasBeenPicked(getorderId, sellerId, purchaserId, purchaserFloor,
      purchaserLocationDetail) {
    FirebaseFirestore.instance
        .collection("orders")
        .doc(widget.getOrderId)
        .update({
      "status": "delivering",
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDeliveringScreen(
          purchaserId: widget.purchaserId,
          purchaseLocation: widget.purchaseLocation,
          purchaseLocationDetail: widget.purchaseLocationDetail,
          sellerId: widget.sellerId,
          getOrderId: widget.getOrderId,
        ),
      ),
    );
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
                  confirmFoodHasBeenPicked(
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
                      "Confirm Pick Up Order",
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
  }
}
