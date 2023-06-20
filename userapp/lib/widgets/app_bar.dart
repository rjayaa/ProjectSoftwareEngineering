import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/assistantMethods/cart_item_counter.dart';
import 'package:userapp/mainScreens/cart_screen.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String? sellerUID;
  MyAppBar({this.bottom, this.sellerUID});
  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Color(0xff272727),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // title: const Text(
      //   "CanteenCartSunib",
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontSize: 16,
      //     fontFamily: "Poppins",
      //   ),
      // ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      automaticallyImplyLeading: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                //send user to cart screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) =>
                            CartScreen(sellerUID: widget.sellerUID)));
              },
            ),
            Positioned(
              child: Stack(children: [
                const Icon(
                  Icons.brightness_1,
                  size: 20.0,
                  color: Colors.orange,
                ),
                Positioned(
                  top: 2,
                  right: 6,
                  child: Center(
                    child: Consumer<CartItemCounter>(
                        builder: (context, counter, c) {
                      return Text(
                        counter.count.toString(),
                        style: const TextStyle(
                            fontSize: 12
                        ),
                      );
                    }),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
