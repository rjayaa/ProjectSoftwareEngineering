import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courierapp/global/global.dart';
import 'package:courierapp/mainScreens/food_picking_screen.dart';
import 'package:courierapp/models/location.dart';
import 'package:flutter/material.dart';
import '../splashscreen/splash_screen.dart';

class ShipmentLocationDesign extends StatelessWidget {
  final Location? model;
  final String? orderStatus;
  final String? orderId;
  final String? sellerId;
  final String? orderByUser;

  ShipmentLocationDesign(
      {this.model,
      this.orderStatus,
      this.orderId,
      this.sellerId,
      this.orderByUser});

  confirmedFoodShipment(BuildContext context, String getOrderId,
      String sellerId, String purchaseId) {
    FirebaseFirestore.instance.collection("orders").doc(getOrderId).update({
      "riderUID": sharedPreferences!.getString("uid"),
      "riderName": sharedPreferences!.getString("name"),
      "status": "picking",
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodPickingScreen(
                purchaserId: purchaseId,
                purchaseLocation: model!.floorNumber,
                purchaseLocationDetail: model!.detailLocation,
                sellerId: sellerId,
                getOrderId: getOrderId,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Shipping Details:',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    "Nama :",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.name!),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "No HP. :",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.phoneNumber!),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Lantai : ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.floorNumber!),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Detail :",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.detailLocation!),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        orderStatus == "ended"
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      confirmedFoodShipment(
                          context, orderId!, sellerId!, orderByUser!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFC7115),
                        borderRadius: BorderRadius.circular(
                            25.0), // Mengatur radius border
                      ),
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Confirm - To Deliver this Parcel",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MySplashScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFC7115),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: MediaQuery.of(context).size.width - 250,
                height: 50,
                child: const Center(
                  child: Text(
                    "Go Back",
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
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
