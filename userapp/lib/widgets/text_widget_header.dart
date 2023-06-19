import 'package:flutter/material.dart';

class TextWidgetHeader extends SliverPersistentHeaderDelegate {
  String? title;
  TextWidgetHeader({this.title});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff1E1E1E)),
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.only(left: 24.0), // Adjust the value as needed
            child: Text(
              title!,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
