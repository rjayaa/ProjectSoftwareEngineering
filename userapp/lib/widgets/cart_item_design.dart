import 'package:flutter/material.dart';
import 'package:userapp/models/items.dart';

class CartItemDesign extends StatefulWidget {
  final Items? model;
  BuildContext? context;
  final List<int>? separateItemQuantitiesList;

  CartItemDesign({
    this.model,
    this.context,
    this.separateItemQuantitiesList,
  });
  @override
  State<CartItemDesign> createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 165,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),

              // title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model!.title!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  // quantity
                  Row(
                    children: [
                      Text(
                        "x ",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        widget.separateItemQuantitiesList.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  // harga
                  Row(
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        widget.model!.price.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
