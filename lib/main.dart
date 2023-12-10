import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_manager.dart';
import 'dashboard_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'splash_screen.dart';
import 'user_list_page.dart';
import 'user_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiManager apiManager = ApiManager(baseUrl: 'http://192.168.178.140/rental_ps');

  //provider digunakan untuk mengirimkan data dari main.dart ke sub page, sehingga semua yang berada pada context provider bisa memanggil datanya.
  //Pada case ini data baseUrl disebar ke page lain
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager()),
        Provider.value(value: apiManager),
      ],    child : MaterialApp(
      title: 'PlayStation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/register': (context) => RegisterPage(),
        '/userList': (context) => UserListPage(),
        '/login': (context) => AuthPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    )
    );
  }
}