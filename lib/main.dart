import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'register_page.dart';
import 'login_page.dart';
import 'dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayStation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
