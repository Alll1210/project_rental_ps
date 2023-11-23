import 'package:flutter/material.dart';

class PSDetailPage extends StatelessWidget {
  final String data;

  PSDetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PS Detail Page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Detail for PlayStation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              data, // Menampilkan data yang diterima dari halaman sebelumnya
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // Tambahkan widget lain sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
