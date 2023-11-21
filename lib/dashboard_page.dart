import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlayStation Rentals'),
      ),
      body: PSList(),
    );
  }
}

class PSList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement logic to fetch and display PlayStation list
    return ListView(
      children: [
        ListTile(title: Text('PlayStation 4')),
        ListTile(title: Text('PlayStation 5')),
        // Add more items as needed
      ],
    );
  }
}
