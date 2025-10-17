import 'package:flutter/material.dart';

import 'math1.dart';
import 'math2.dart';



void main() => runApp(SimpleInterestApp());

class SimpleInterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FuelCostCalculator(),
    );
  }
}

class SimpleInterestCalculator extends StatefulWidget {
  @override
  _SimpleInterestCalculatorState createState() =>
      _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();

  double totalInterest = 0;
  double finalAmount = 0;

  void calculateInterest() {
    double p = double.tryParse(principalController.text) ?? 0;
    double r = double.tryParse(rateController.text) ?? 0;
    double t = double.tryParse(timeController.text) ?? 0;

    setState(() {
      totalInterest = (p * r * t) / 100;
      finalAmount = p + totalInterest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interest Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              controller: principalController,
              decoration: InputDecoration(
                  labelText: "Principal",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )),//Darneya tk
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: rateController,
              decoration: InputDecoration(
                labelText: "Rate (%)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )

              ),//Suder tk
              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 1,
              controller: timeController,
              decoration: InputDecoration(
                labelText: "Time (years)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )

              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateInterest,
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            Text("Total Interest: $totalInterest"),
            Text("Final Amount: $finalAmount"),
          ],
        ),
      ),
    );
  }
}
