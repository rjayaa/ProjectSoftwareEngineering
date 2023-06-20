import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/assistantMethods/location_changer.dart';
import 'package:userapp/mainScreens/save_destination_screen.dart';
import 'package:userapp/mainScreens/simple_app_bar.dart';
import 'package:userapp/models/location.dart';
import 'package:userapp/widgets/location_design.dart';
import 'package:userapp/widgets/progress_bar.dart';

import '../global/global.dart';
import 'cart_screen.dart';

class DestinationScreen extends StatefulWidget {
  final double? totalAmount;
  final String? sellerUID;

  DestinationScreen({this.totalAmount, this.sellerUID});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "CanteenCartSunib"),
      backgroundColor: Color(0xff272727),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Add New Location",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffFC7115),
        icon: const Icon(
          Icons.add_location,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (c) => SaveDestinationScreen()));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Select Location :",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Consumer<LocationChanger>(builder: (context, location, c) {
            return Flexible(
                child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(sharedPreferences!.getString("uid"))
                  .collection("userLocation")
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(
                        child: circularProgress(),
                      )
                    : snapshot.data!.docs.length == 0
                        ? Container()
                        : ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return LocationDesign(
                                currentIndex: location.count,
                                value: index,
                                locationID: snapshot.data!.docs[index].id,
                                totalAmount: widget.totalAmount,
                                sellerUID: widget.sellerUID,
                                model: Location.fromJson(
                                    snapshot.data!.docs[index].data()!
                                        as Map<String, dynamic>),
                              );
                            },
                          );
              },
            ));
          }),
        ],
      ),
    );
  }
}
