import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_manager.dart';
import 'user_manager.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _authenticate(BuildContext context) async {
    final apiManager = Provider.of<ApiManager>(context, listen: false);
    final userManager = Provider.of<UserManager>(context, listen: false);

    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      final token = await apiManager.authenticate(username, password);

      if (token != null && token.isNotEmpty) {
        userManager.setAuthToken(token);
        Navigator.pushReplacementNamed(context, '/userList');
      } else {
        print('Authentication failed. Empty token received.');
        // Handle authentication failure
      }
    } catch (e) {
      print('Authentication failed. Error: $e');
      // Handle authentication failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.white],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Masuk ke Al's Stations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,  // Tambahkan kontroler
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email, color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,  // Tambahkan kontroler
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.lock, color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _authenticate(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text('Login', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Don\'t have an account? Register here',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
