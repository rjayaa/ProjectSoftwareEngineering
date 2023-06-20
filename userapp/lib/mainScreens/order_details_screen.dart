import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:userapp/widgets/progress_bar.dart';
import 'package:userapp/widgets/status_banner.dart';
import '../global/global.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String? orderID;

  OrderDetailsScreen({this.orderID});
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String orderStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection("users")
              .doc(sharedPreferences!.getString("uid"))
              .collection("orders")
              .doc(widget.orderID)
              .get(),
          builder: (c, snapshot) {
            Map? dataMap;
            if (snapshot.hasData) {
              dataMap = snapshot.data!.data()! as Map<String, dynamic>;
              orderStatus = dataMap["status"].toString();
            }
            return snapshot.hasData
                ? Container(
                    child: Column(
                      children: [
                        StatusBanner(
                          status: dataMap!["isSuccess"],
                          orderStatus: orderStatus,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Text(
                            "Order ID:",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        Center(
                          child: Text(
                            widget.orderID!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Total : " "Rp. " +
                                  dataMap["totalAmount"].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order at: " +
                                DateFormat("dd MMMM, yyyy - hh:mm aa").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(dataMap["orderTime"]))),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: circularProgress(),
                  );
          },
        ),
      ),
    );
  }
}
