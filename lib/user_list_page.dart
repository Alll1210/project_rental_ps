import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_manager.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Map<String, dynamic>> _users = [];

  @override
  Widget build(BuildContext context) {
    final apiManager = Provider.of<ApiManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User List Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Logout logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  final users = await apiManager.getUsers();

                  // Tambahkan pengecekan agar nilai 'users' tidak null
                  if (users != null && users is List) {
                    setState(() {
                      _users = users;
                    });
                  } else {
                    print('API returned null or invalid data for users.');
                  }
                } catch (e) {
                  print('Failed to get users. Error: $e');
                  // Handle user fetching failure
                }
              },
              child: Text('Refresh Users'),
            ),
            SizedBox(height: 16),
            Text('Users:'),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(
                      'Username: ${user['username']}, Email: ${user['email']}, Password: ${user['password']}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
