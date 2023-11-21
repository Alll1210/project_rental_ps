import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('PlayStation 1'),
              // Other details for PlayStation 1
            ),
            ListTile(
              title: Text('PlayStation 2'),
              // Other details for PlayStation 2
            ),
            // Add more ListTiles for other PlayStations
          ],
        ),
      ),
    );
  }
}
