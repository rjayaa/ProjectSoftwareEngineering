import 'package:flutter/material.dart';
import 'package:userapp/mainScreens/item_detail_screen.dart';
import 'package:userapp/models/Items.dart';

class ItemsDesignWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;

  ItemsDesignWidget({this.model, this.context});
  @override
  State<ItemsDesignWidget> createState() => _ItemsDesignWidgetState();
}

class _ItemsDesignWidgetState extends State<ItemsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => ItemDetailScreen(model: widget.model)));
      },
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.model!.thumbnailUrl!,
                  height: 150.0,
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.model!.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.model!.shortInfo!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
