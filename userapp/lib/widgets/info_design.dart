import 'package:flutter/material.dart';
import 'package:userapp/models/sellers.dart';

class InfoDesignWidget extends StatefulWidget {
  Sellers? model;
  BuildContext? context;

  InfoDesignWidget({this.model, this.context});
  @override
  State<InfoDesignWidget> createState() => _InfoDesignWidgetState();
}

class _InfoDesignWidgetState extends State<InfoDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
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
            ],
          ),
        ),
      ),
    );
  }
}
