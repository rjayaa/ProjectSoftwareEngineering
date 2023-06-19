import 'package:flutter/material.dart';
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
      appBar: MyAppBar(),
      body: Column(
        children: [
          Image.network(widget.model!.thumbnailUrl.toString()),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: NumberInputPrefabbed.roundedButtons(
              controller: counterTextEditingController,
              incDecBgColor: Color(0xffFC7115),
              min: 1,
              max: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.shortInfo.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.price.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  // add to cart
                  int itemCounter =
                      int.parse(counterTextEditingController.text);

                  addItemToCart(widget.model!.itemID, context, itemCounter);
                },
                child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFC7115),
                    ),
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
