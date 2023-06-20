import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:userapp/global/global.dart';
import 'package:userapp/mainScreens/simple_app_bar.dart';
import 'package:userapp/models/location.dart';

import '../widgets/text_field.dart';

class SaveDestinationScreen extends StatelessWidget {
  final _name = TextEditingController();
  final _phoneNumber = TextEditingController();
  String? _floorNumber;
  String? _timeRetrieve;
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
          // save location infoo
          if (formKey.currentState!.validate()) {
            final model = Location(
              name: _name.text.trim(),
              phoneNumber: _phoneNumber.text.trim(),
              floorNumber: _floorNumber?.trim(),
              retrieveTime: _timeRetrieve?.trim(),
              detailLocation: _detailLocation.text.trim(),
            ).toJson();
            FirebaseFirestore.instance
                .collection("users")
                .doc(sharedPreferences!.getString("uid"))
                .collection("userLocation")
                .doc(DateTime.now().millisecondsSinceEpoch.toString())
                .set(model)
                .then((value) {
              Fluttertoast.showToast(msg: "New Location has been saved.");
              formKey.currentState!.reset();
            });
          }
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
                    color: Colors.white,
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
                    hint: "Nama",
                    controller: _name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    hint: "No. HP",
                    controller: _phoneNumber,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      hint: const Text(
                        "Lantai",
                        style: TextStyle(color: Colors.white70),
                      ),
                      value: _floorNumber,
                      dropdownColor:
                          Color(0xff272727), // Warna dropdown saat dibuka
                      items: <String>['G', '1', '2', '3', '4', '5']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: _floorNumber == value
                                  ? Colors.white70
                                  : Colors
                                      .white70, // Warna putih saat item dipilih
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _floorNumber = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      hint: const Text(
                        "Jadwal Diterima",
                        style: TextStyle(color: Colors.white70),
                      ),
                      value: _timeRetrieve,
                      dropdownColor:
                          Color(0xff272727), // Warna dropdown saat dibuka
                      items: <String>[
                        '09:00',
                        '11:00',
                        '13:00',
                        '14:00',
                        '15:00',
                        '17:00'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: _timeRetrieve == value
                                  ? Colors.white70
                                  : Colors
                                      .white70, // Warna putih saat item dipilih
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _timeRetrieve = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    hint: "Detail Ruangan/Tempat",
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
