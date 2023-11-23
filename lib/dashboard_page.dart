import 'package:flutter/material.dart';
import 'PSDetailPage.dart';

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

  // Satu list utama yang berisi tiga list data untuk masing-masing jenis PlayStation
  final List<List<String>> allDataList = [
    ['Data 1 for PSP', 'Data 2 for PSP', 'Data 3 for PSP', /* Tambahkan lebih banyak data sesuai kebutuhan */],
    ['Data 1 for PS1', 'Data 2 for PS1', 'Data 3 for PS1', /* Tambahkan lebih banyak data sesuai kebutuhan */],
    ['Data 1 for PS2', 'Data 2 for PS2', 'Data 3 for PS2', /* Tambahkan lebih banyak data sesuai kebutuhan */],
    // Tambahkan lebih banyak list data sesuai kebutuhan
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
                print('Cek button pressed for $playstation');
                navigateToDetailPage(context, index);
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

  void navigateToDetailPage(BuildContext context, int index) {
    String dataForPS = allDataList[index].join('\n');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PSDetailPage(data: dataForPS)),
    );
  }
}
