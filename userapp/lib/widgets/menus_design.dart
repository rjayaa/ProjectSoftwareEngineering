import 'package:flutter/material.dart';
import 'package:userapp/models/menus.dart';

class MenusDesignWidget extends StatelessWidget {
  Menus? model;
  BuildContext? context;
  MenusDesignWidget({this.model, this.context});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        // Implement your onTap logic here
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
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
                model!.thumbnailUrl!,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                model!.menuTitle!,
                style: const TextStyle(
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
              Text(
                model!.menuInfo!,
                style: const TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
