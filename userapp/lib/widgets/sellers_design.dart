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
            MaterialPageRoute(
                builder: (c) => MenusScreen(model: widget.model)));
      },
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
<<<<<<< HEAD
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.model!.sellerAvatarUrl!,
                  fit: BoxFit.cover,
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
=======
          height: 265,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 20,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.sellerAvatarUrl!,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.model!.sellerName!,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontFamily: "Roboto",
                ),
              ),
              Divider(
                height: 1,
                thickness: 3,
                color: Colors.grey[300],
              ),
>>>>>>> main
            ],
          ),
        ),
      ),
    );
  }
}
