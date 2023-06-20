import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/assistantMethods/location_changer.dart';
import 'package:userapp/mainScreens/placed_order_screen.dart';
import 'package:userapp/models/location.dart';

class LocationDesign extends StatefulWidget {
  final Location? model;
  final int? currentIndex;
  final int? value;
  final String? locationID;
  final double? totalAmount;
  final String? sellerUID;

  LocationDesign({
    this.model,
    this.currentIndex,
    this.value,
    this.locationID,
    this.totalAmount,
    this.sellerUID,
  });
  @override
  State<LocationDesign> createState() => _LocationDesignState();
}

class _LocationDesignState extends State<LocationDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.black,
        child: Column(
          children: [
            // location info
            Row(
              children: [
                Radio(
                  groupValue: widget.currentIndex!,
                  value: widget.value!,
                  activeColor: Color(0xffFC7115),
                  onChanged: (val) {
                    // provider
                    Provider.of<LocationChanger>(context, listen: false)
                        .displayResult(widget.value);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              const Text(
                                "Nama: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.model!.name.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "No. Hp: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.phoneNumber.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Lantai: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.floorNumber.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Jadwal Menerima: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.retrieveTime.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Detail Tempat: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.detailLocation.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            widget.value == Provider.of<LocationChanger>(context).count
                ? ElevatedButton(
                    child: Text(
                      "Proceed",
                      style:
                          TextStyle(color: Colors.white, fontFamily: "Poppins"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFC7115),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => PlaceOrderScreen(
                                    locationID: widget.locationID,
                                    totalAmount: widget.totalAmount,
                                    sellerUID: widget.sellerUID,
                                  )));
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
