import 'package:flutter/material.dart';
import 'package:userapp/models/location.dart';

class ShipmentLocationDesign extends StatelessWidget {
  final Location? model;

  ShipmentLocationDesign({this.model});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping Detailss",
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: "Poppins"),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    model!.name!,
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "No. HP",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    model!.phoneNumber!,
                  ),
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
        Text(
          model!.floorNumber! + model!.retrieveTime! + model!.detailLocation!,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
