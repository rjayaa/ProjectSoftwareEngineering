import 'package:flutter/material.dart';
import 'package:foodly/paymentpage.dart';
class claudekitchen extends StatefulWidget {
  const claudekitchen({Key? key}) : super(key: key);

  @override
  _claudekitchen createState() => _claudekitchen();
}

class _claudekitchen extends State<claudekitchen> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claude Kitchen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        // Atur jarak pada bagian kiri
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/nasi3.png',
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 0),
            const Text(
              'Ayam Charsiu & Nasi Hainam',
              style: TextStyle(fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Rp 20.000-',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decrementQuantity,
                  icon: const Icon(Icons.remove),
                  color: Colors.white,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                IconButton(
                  onPressed: incrementQuantity,
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                ),
                SizedBox(width: 20), // Atur jarak antara tombol dan TextButton
                Container(
                  width: 150, // Atur panjang tombol
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF4D270E), // Atur filled color
                      padding: EdgeInsets.all(16.0), // Atur padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Atur border radius
                      ),
                    ),
                    onPressed: () {
                      // Tindakan yang dijalankan saat tombol ditekan
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const paymentpage()),
                      );
                    },
                    child: Text(
                      'Bayar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}

