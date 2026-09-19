import 'package:flutter/material.dart';

void main() {
  runApp(const BuildingCostApp());
}

class BuildingCostApp extends StatelessWidget {
  const BuildingCostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Building Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building Cost Calculator'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Building Cost Calculator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

