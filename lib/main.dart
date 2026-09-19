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
  double _cementCost = 0.0;
  double _steelCost = 0.0;
  double _laborCost = 0.0;
  double _otherCost = 0.0;

  void _calculateCost() {
    double area = double.tryParse(_areaController.text) ?? 0.0;
    double rate = double.tryParse(_rateController.text) ?? 0.0;

    setState(() {
      _totalCost = area * rate;
      // Standard Construction Estimate Percentages
      _cementCost = _totalCost * 0.16; // 16% Cement
      _steelCost = _totalCost * 0.15;  // 15% Steel
      _laborCost = _totalCost * 0.25;  // 25% Labor
      _otherCost = _totalCost * 0.44;  // 44% Bricks, Tiles, Paint, etc.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Building Cost Calculator')),
      body: SingleChildScrollView(
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
              child: const Text('Calculate Cost & Breakdown'),
            ),
            const SizedBox(height: 24),
            if (_totalCost > 0) ...[
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue.shade50,
                child: Text(
                  'Estimated Cost: ₹${_totalCost.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Material & Labor Breakdown:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                title: const Text('Labor Cost (25%)'),
                trailing: Text('₹${_laborCost.toStringAsFixed(2)}'),
              ),
              ListTile(
                title: const Text('Cement Cost (16%)'),
                trailing: Text('₹${_cementCost.toStringAsFixed(2)}'),
              ),
              ListTile(
                title: const Text('Steel Cost (15%)'),
                trailing: Text('₹${_steelCost.toStringAsFixed(2)}'),
              ),
              ListTile(
                title: const Text('Bricks, Tiles & Others (44%)'),
                trailing: Text('₹${_otherCost.toStringAsFixed(2)}'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
