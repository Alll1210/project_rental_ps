import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlayStation Rentals'),
        backgroundColor: Colors.blue, // Ubah warna app bar sesuai keinginan
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PlayStation 5',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/ps_image.jpg',
              height: 150, // Sesuaikan tinggi gambar sesuai kebutuhan
              width: 150, // Sesuaikan lebar gambar sesuai kebutuhan
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement "cek" button logic
                // You can add specific actions or navigate to another page
                print('Cek button pressed');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Ubah warna tombol sesuai keinginan
              ),
              child: Text('Cek'),
            ),
          ],
        ),
      ),
    );
  }
}
