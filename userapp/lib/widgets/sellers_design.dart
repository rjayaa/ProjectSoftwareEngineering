import 'package:flutter/material.dart';
import 'package:userapp/mainScreens/menus_screen.dart';
import 'package:userapp/models/sellers.dart';

class SellersDesignWidget extends StatefulWidget {
  Sellers? model;
  BuildContext? context;

  SellersDesignWidget({this.model, this.context});
  @override
  State<SellersDesignWidget> createState() => _SellersDesignWidgetState();
}

class _SellersDesignWidgetState extends State<SellersDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => MenusScreen(model: widget.model)),
        );
      },
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(
                  widget.model!.sellerAvatarUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              widget.model!.sellerName!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Roboto",
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
