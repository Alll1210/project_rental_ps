import 'package:flutter/material.dart';
import 'PSDetailPage.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> playstationList = [
    {
      'name': 'PlayStation Portable (PSP)',
      'imagePath': 'assets/ps_image0.jpg',
      'data': ['Sony PSP\n'],
      'game': [
        'God of War: Chains of Olympus',
        'Final Fantasy VII: Crisis Core',
        'Persona 3 Portable',
        'Metal Gear Solid: Peace Walker',
        'Monster Hunter Freedom Unite',
        'Dissidia 012 Final Fantasy',
        'Grand Theft Auto: Vice City Stories',
        'Kingdom Hearts: Birth by Sleep',
        'Tactics Ogre: Let Us Cling Together',
        'Lumines: Puzzle Fusion',
        'dll.',
      ],
      'harga': 'Rp 10.000 / 2 Jam',
    },
    {
      'name': 'PlayStation 1',
      'imagePath': 'assets/ps_image1.jpg',
      'data': ['Data 1 for PS1', 'Data 2 for PS1', 'Data 3 for PS1'],
      'game': [
        'God of War: Chains of Olympus',
        'Final Fantasy VII: Crisis Core',
        'Persona 3 Portable',
      ],
      'harga': 'Rp 1.500.000',
    },
    {
      'name': 'PlayStation 2',
      'imagePath': 'assets/ps_image2.jpg',
      'data': ['Data 1 for PS2', 'Data 2 for PS2', 'Data 3 for PS2'],
      'game': [
        'God of War: Chains of Olympus',
        'Final Fantasy VII: Crisis Core',
        'Persona 3 Portable',
      ],
      'harga': 'Rp 2.000.000',
    },
    {
      'name': 'PlayStation 3',
      'imagePath': 'assets/ps_image3.jpg',
      'data': ['Data 1 for PS2', 'Data 2 for PS2', 'Data 3 for PS2'],
      'game': [
        'God of War: Chains of Olympus',
        'Final Fantasy VII: Crisis Core',
        'Persona 3 Portable',
      ],
      'harga': 'Rp 2.000.000',
    },
    {
      'name': 'PlayStation 4',
      'imagePath': 'assets/ps_image4.jpg',
      'data': ['Data 1 for PS2', 'Data 2 for PS2', 'Data 3 for PS2'],
      'game': [
        'God of War: Chains of Olympus',
        'Final Fantasy VII: Crisis Core',
        'Persona 3 Portable',
      ],
      'harga': 'Rp 2.000.000',
    },
    {
      'name': 'PlayStation 5',
      'imagePath': 'assets/ps_image5.jpg',
      'data': ['Data 1 for PS2', 'Data 2 for PS2', 'Data 3 for PS2'],
      'game': [
        'God of War: Chains of Olympus',
        'Final Fantasy VII: Crisis Core',
        'Persona 3 Portable',
      ],
      'harga': 'Rp 2.000.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al's Stations"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              print('Profile icon pressed');
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: playstationList.length,
                itemBuilder: (context, index) {
                  return buildPlayStationItem(context, playstationList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlayStationItem(BuildContext context, Map<String, dynamic> playstation) {
    String name = playstation['name'];
    String imagePath = playstation['imagePath'];
    List<String> data = playstation['data'];

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
                print('Cek button pressed for $name');
                navigateToDetailPage(context, playstation);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 5),
                  Text(
                    'Cek',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetailPage(BuildContext context, Map<String, dynamic> playstation) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PSDetailPage(playstation: playstation)),
    );
  }
}