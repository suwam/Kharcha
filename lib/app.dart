import 'package:flutter/material.dart';
import 'views/dashboard/dashboard_page.dart';

class KharchaApp extends StatelessWidget {
  const KharchaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kharcha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: DashboardPage(),
    );
  }
}
