import 'package:flutter/material.dart';
import 'package:userapp/assistantMethods/asisstant_methods.dart';
import 'package:userapp/widgets/app_bar.dart';

class CartScreen extends StatefulWidget {
  final String? sellerUID;
  CartScreen({this.sellerUID});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    separateItemQuantities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.sellerUID),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              label: const Text(
                "Clear Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
              ),
              backgroundColor: const Color(0xffFC7115),
              icon: const Icon(Icons.clear_all),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              label: const Text(
                "Check out",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
              ),
              backgroundColor: const Color(0xffFC7115),
              icon: const Icon(Icons.navigate_next),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
