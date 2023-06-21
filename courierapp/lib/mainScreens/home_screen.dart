import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:courierapp/authentication/auth_screen.dart';
import 'package:courierapp/global/global.dart';
import 'package:courierapp/mainScreens/new_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Card makeDashboardItem(String title, IconData iconData, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFF272727),
        ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              //New Available Orders
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => NewOrdersScreen()));
            }
            if (index == 1) {
              //Parcels in Progress
            }
            if (index == 2) {
              //Not Yet Delivered
            }
            if (index == 3) {
              //History
            }
            if (index == 4) {
              //Total Earnings
            }
            if (index == 5) {
              //Logout
              firebaseAuth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const AuthScreen()));
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50.0),
              Center(
                child: Icon(
                  iconData,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getPerDeliveryPrice();
    getRiderPreviousEarnings();
  }

  getRiderPreviousEarnings() {
    FirebaseFirestore.instance
        .collection("couriers")
        .doc(sharedPreferences!.getString("uid"))
        .get()
        .then((snap) {
      prevRiderEarnings = snap.data()!["earnings"].toString();
    });
  }

  getPerDeliveryPrice() {
    FirebaseFirestore.instance
        .collection("perDelivery")
        .doc("T4kTr4lhnsVBf9eqAnYE")
        .get()
        .then((snap) {
      perDeliveryAmount = snap.data()!["amount"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFF272727),
          ),
        ),
        title: Text(
          "Welcome " + sharedPreferences!.getString("name")!,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontFamily: "Poppins",
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 1),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(2),
          children: [
            makeDashboardItem(
              "New Available Orders",
              Icons.assignment,
              0,
            ),
            // makeDashboardItem("Parcels in Progress", Icons.airport_shuttle, 1),
            // makeDashboardItem("Not Yet Delivered", Icons.location_history, 2),
            // makeDashboardItem("History", Icons.done_all, 3),
            // makeDashboardItem("Total Earnings", Icons.monetization_on, 4),
            makeDashboardItem("Logout", Icons.logout, 5),
          ],
        ),
      ),
    );
  }
}
