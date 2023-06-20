import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:userapp/models/sellers.dart';
import 'package:userapp/widgets/sellers_design.dart';

import 'package:userapp/widgets/progress_bar.dart';

import '../widgets/bottom_nav_bar.dart';

// import '../global/global.dart';
// import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff272727),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.fromLTRB(35, 40, 35, 30),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                  hintText: 'Mau makan apa?',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: CustomScrollView(
                  slivers: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("sellers")
                          .snapshots(),
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? SliverToBoxAdapter(
                                child: Center(
                                  child: circularProgress(),
                                ),
                              )
                            : SliverStaggeredGrid.countBuilder(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                staggeredTileBuilder: (c) =>
                                    StaggeredTile.count(1, 1.6),
                                itemBuilder: (context, index) {
                                  Sellers sModel = Sellers.fromJson(
                                      snapshot.data!.docs[index].data()!
                                          as Map<String, dynamic>);
                                  return SellersDesignWidget(
                                    model: sModel,
                                    context: context,
                                  );
                                },
                                itemCount: snapshot.data!.docs.length,
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
