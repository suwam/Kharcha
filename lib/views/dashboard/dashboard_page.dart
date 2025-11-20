import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kharcha Dashboard"),
        centerTitle: true,
      ),

      body: const Center(
        child: Text(
          "Welcome to Kharcha!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
