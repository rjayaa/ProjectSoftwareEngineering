import 'package:flutter/material.dart';
import 'package:foodly/claudekitchen.dart';
class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<String> buttonLabels = [
    'Teh Poci',
    'Pasta',
    'Jus',
    'Claude Kitchen',
    'Rocky Fried Chicken',
    'Pecel',
    'Geprek',
    'Padang',
    'Bakmie',
  ];

  List<String> buttonImages = [
    'assets/images/f_0.png',
    'assets/images/f_1.png',
    'assets/images/f_2.png',
    'assets/images/f_3.png',
    'assets/images/f_4.png',
    'assets/images/f_5.png',
    'assets/images/f_6.png',
    'assets/images/f_7.png',
    'assets/images/f_8.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CanteenCart Sunib'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Mau makan apa?',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 40.0,
              ),
              itemCount: buttonLabels.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const claudekitchen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          buttonImages[index],
                          width: 76,
                          height: 76,
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          buttonLabels[index],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
