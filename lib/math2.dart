import 'package:flutter/material.dart';

class FuelCostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FuelCostCalculator(),
    );
  }
}

class FuelCostCalculator extends StatefulWidget {
  @override
  _FuelCostCalculatorState createState() => _FuelCostCalculatorState();
}

class _FuelCostCalculatorState extends State<FuelCostCalculator> {
  final distanceController = TextEditingController();
  final mileageController = TextEditingController();
  final priceController = TextEditingController();

  double estimatedCost = 0;

  void calculateFuelCost() {
    double distance = double.tryParse(distanceController.text) ?? 0;
    double mileage = double.tryParse(mileageController.text) ?? 1;
    double price = double.tryParse(priceController.text) ?? 0;

    setState(() {
      estimatedCost = (distance / mileage) * price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fuel Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: distanceController,
              decoration: InputDecoration(
                labelText: "Distance (km)",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: mileageController,
              decoration: InputDecoration(
                labelText: "Mileage (km/L)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: "Fuel Price (per L)",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10))
                 )
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFuelCost,
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            Text("Estimated Cost: $estimatedCost Tk"),
          ],
        ),
      ),
    );
  }
}

