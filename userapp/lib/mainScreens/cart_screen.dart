import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:userapp/assistantMethods/asisstant_methods.dart';
import 'package:userapp/assistantMethods/total_amount.dart';
import 'package:userapp/mainScreens/destination_screen.dart';
import 'package:userapp/models/items.dart';
import 'package:userapp/widgets/cart_item_design.dart';
import 'package:userapp/widgets/progress_bar.dart';

import '../assistantMethods/cart_item_counter.dart';
import '../splashscreen/splash_screen.dart';
import '../widgets/text_widget_header.dart';

class CartScreen extends StatefulWidget {
  final String? sellerUID;
  CartScreen({this.sellerUID});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int>? separateItemQuantityList;
  TextEditingController quantityController = TextEditingController();
  num totalAmount = 0;
  @override
  void initState() {
    super.initState();
    totalAmount = 0;
    Provider.of<TotalAmount>(context, listen: false).displayTotalAmount(0);

    separateItemQuantityList = separateItemQuantities();
  }

  @override
  Widget build(BuildContext context) {
    var selectedQuantity;
    return Scaffold(
      // appBar: MyAppBar(sellerUID: widget.sellerUID),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xff272727),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.clear_all),
          onPressed: () {
            clearCartNow(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => const MySplashScreen()));
            Fluttertoast.showToast(msg: "Cart has been cleared.");
          },
        ),
        title: const Text(
          "CanteenCartSunib",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Poppins",
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
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
              onPressed: () {
                clearCartNow(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const MySplashScreen()));
                Fluttertoast.showToast(msg: "Cart has been cleared.");
              },
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => DestinationScreen(
                              totalAmount: totalAmount.toDouble(),
                              sellerUID: widget.sellerUID,
                            )));
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // overall total price

          SliverPersistentHeader(
            pinned: true,
            delegate: TextWidgetHeader(
              title: "My Cart List",
            ),
          ),

          // display cart items with quantity number
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("items")
                  .where("itemID", whereIn: separateItemIDs())
                  .orderBy("publishedDate", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : snapshot.data!.docs.length == 0
                        ? // startBuildingCart()
                        Container()
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                Items model = Items.fromJson(
                                  snapshot.data!.docs[index].data()!
                                      as Map<String, dynamic>,
                                );

                                if (index == 0) {
                                  totalAmount = 0;
                                  totalAmount = totalAmount +
                                      (model.price! *
                                          separateItemQuantityList![index]);
                                } else {
                                  totalAmount = totalAmount +
                                      (model.price! *
                                          separateItemQuantityList![index]);
                                }

                                if (snapshot.data!.docs.length - 1 == index) {
                                  WidgetsBinding.instance!
                                      .addPostFrameCallback((timeStamp) {
                                    Provider.of<TotalAmount>(context,
                                            listen: false)
                                        .displayTotalAmount(
                                            totalAmount.toDouble());
                                  });
                                }

                                return CartItemDesign(
                                  model: model,
                                  context: context,
                                  quanNumber: separateItemQuantityList![index],
                                );
                              },
                              childCount: snapshot.hasData
                                  ? snapshot.data!.docs.length
                                  : 0,
                            ),
                          );
              }),
          SliverToBoxAdapter(
            child: Consumer2<TotalAmount, CartItemCounter>(
              builder: (context, amountProvider, cartProvider, c) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: cartProvider.count == 0
                        ? Container()
                        : Container(
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "Total Price: " +
                                      amountProvider.tAmount.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
