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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  double _totalCost = 0.0;

  void _calculateCost() {
    double area = double.tryParse(_areaController.text) ?? 0.0;
    double rate = double.tryParse(_rateController.text) ?? 0.0;

    setState(() {
      _totalCost = area * rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Building Cost Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _areaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Total Area (sq. ft)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rate per sq. ft (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateCost,
              child: const Text('Calculate Cost'),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade50,
              child: Text(
                'Estimated Cost: ₹${_totalCost.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

