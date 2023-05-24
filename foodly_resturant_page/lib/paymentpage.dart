import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class paymentpage extends StatefulWidget {
  const paymentpage({Key? key}) : super(key: key);

  @override
  _paymentpage createState() => _paymentpage();
}

class _paymentpage extends State<paymentpage> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_pickedImage != null)
            Image.file(
              _pickedImage!,
              width: 200,
              height: 200,
            ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Upload Bukti Transfer'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Tindakan yang dijalankan saat tombol Bayar ditekan
            },
            child: Text('Bayar'),
          ),
        ],
      ),
    );
  }
}

