import 'package:flutter/material.dart';

class ShipmentScreen extends StatelessWidget {
  String? purchaserId;
  String? purchaseLocation;
  String? purchaseLocationDetail;
  String? sellerId;
  String? getOrderID;

  ShipmentScreen(
      {this.purchaserId,
      this.purchaseLocation,
      this.purchaseLocationDetail,
      this.sellerId,
      this.getOrderID});
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const MySplashScreen()));
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
