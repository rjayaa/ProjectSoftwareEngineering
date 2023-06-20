import 'package:flutter/material.dart';
import 'package:userapp/mainScreens/items_screen.dart';
import 'package:userapp/models/Menus.dart';

class MenusDesignWidget extends StatelessWidget {
  final Menus? model;
  BuildContext? context;
  MenusDesignWidget({this.model, this.context});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ItemsScreen(model: model),
          ),
        );
      },
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  model!.thumbnailUrl!,
                  height: 150.0,
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                model!.menuTitle!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model!.menuInfo!,
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
