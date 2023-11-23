import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final List<String> playstationList = [
    'PlayStation Portable (PSP)',
    'PlayStation 1',
    'PlayStation 2',
    'PlayStation 3',
    'PlayStation 4',
    'PlayStation 5',
    // Tambahkan lebih banyak item sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlayStation Rentals'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: playstationList.length,
          itemBuilder: (context, index) {
            return buildPlayStationItem(context, playstationList[index], index);
          },
        ),
      ),
    );
  }

  Widget buildPlayStationItem(BuildContext context, String playstation, int index) {
    // Membuat path untuk gambar berdasarkan index
    String imagePath = 'assets/ps_image$index.jpg';

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              playstation,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement "cek" button logic for the specific PlayStation
                print('Cek button pressed for $playstation');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Cek'),
            ),
          ],
        ),
      ),
    );
  }
}
