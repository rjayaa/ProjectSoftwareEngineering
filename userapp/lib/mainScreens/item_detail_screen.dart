import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:userapp/models/Items.dart';
import 'package:userapp/widgets/app_bar.dart';

import '../assistantMethods/asisstant_methods.dart';

class ItemDetailScreen extends StatefulWidget {
  final Items? model;

  ItemDetailScreen({this.model});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  TextEditingController counterTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.model!.sellerUID),
      body: Container(
        color: Color(0xff272727),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.model!.thumbnailUrl!,
                height: 200.0,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 35.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: NumberInputPrefabbed.roundedButtons(
                style: TextStyle(color: Colors.white),
                controller: counterTextEditingController,
                numberFieldDecoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                incDecBgColor: Colors.white,
                incIconColor: Colors.white,
                decIconColor: Colors.white,
                min: 1,
                max: 5,
                initialValue: 1,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.model!.title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.model!.shortInfo.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.model!.price.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    int itemCounter =
                        int.parse(counterTextEditingController.text);
                    // 1. check if item exist already in cart
                    List<String> separateItemIDsList = separateItemIDs();
                    separateItemIDsList.contains(widget.model!.itemID)
                        ? Fluttertoast.showToast(
                            msg: "Item is already in Cart.")
                        :
                        // 2. add to cart
                        addItemToCart(
                            widget.model!.itemID, context, itemCounter);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFC7115),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
