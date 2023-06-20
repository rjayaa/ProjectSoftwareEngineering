import 'package:flutter/material.dart';
import 'package:userapp/mainScreens/simple_app_bar.dart';

import '../widgets/text_field.dart';

class SaveDestinationScreen extends StatelessWidget {
  final _name = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _floorNumber = TextEditingController();
  final _timeRetrieve = TextEditingController();
  final _detailLocation = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      backgroundColor: Color(0xff272727),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        label: const Text(
          "Save Now",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        onPressed: () {
          // save location info
        },
        backgroundColor: Color(0xffFC7115),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Save Location",
                  style: TextStyle(
                    color: Colors.white60,
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                    hint: "Name",
                    controller: _name,
                  ),
                  MyTextField(
                    hint: "Phone Number",
                    controller: _phoneNumber,
                  ),
                  MyTextField(
                    hint: "Floor Number",
                    controller: _floorNumber,
                  ),
                  MyTextField(
                    hint: "Retrieve Time",
                    controller: _timeRetrieve,
                  ),
                  MyTextField(
                    hint: "Detail Location",
                    controller: _detailLocation,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
