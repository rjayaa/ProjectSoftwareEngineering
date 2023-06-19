import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:userapp/assistantMethods/asisstant_methods.dart';
import 'package:userapp/models/items.dart';
import 'package:userapp/widgets/app_bar.dart';
import 'package:userapp/widgets/cart_item_design.dart';
import 'package:userapp/widgets/progress_bar.dart';

import '../widgets/text_widget_header.dart';

class CartScreen extends StatefulWidget {
  final String? sellerUID;
  CartScreen({this.sellerUID});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int>? separateItemQuantityList;
  @override
  void initState() {
    super.initState();
    separateItemQuantities();
    separateItemQuantityList = separateItemQuantities();
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
      body: CustomScrollView(
        slivers: [
          // overall total price

          SliverPersistentHeader(
            pinned: true,
            delegate: TextWidgetHeader(
              title: "Total Amount = 120",
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
              })
        ],
      ),
    );
  }
}
