import 'package:flutter/material.dart';
import 'package:userapp/models/Items.dart';
import 'package:userapp/widgets/app_bar.dart';

class ItemDetailScreen extends StatefulWidget {
  final Items? model;

  ItemDetailScreen({this.model});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
    );
  }
}
