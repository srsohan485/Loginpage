import 'package:flutter/material.dart';

class DiscountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiscountCalculator(),
    );
  }
}

class DiscountCalculator extends StatefulWidget {
  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  final priceController = TextEditingController();
  final discountController = TextEditingController();

  double finalPrice = 0;

  void calculateDiscount() {
    double price = double.tryParse(priceController.text) ?? 0;
    double discount = double.tryParse(discountController.text) ?? 0;

    setState(() {
      finalPrice = price - (price * discount / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Discount Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //-----------------editText-------------------
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: "Original Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
              keyboardType: TextInputType.number,
            ),
            //---------------editText----------------------
            SizedBox(height: 10),
            TextFormField(
              controller: discountController,
              decoration: InputDecoration(
                labelText: "Discount (%)",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
              keyboardType: TextInputType.number,
            ),
            //----------------button--------------------------
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateDiscount,
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            Text("Final Price: $finalPrice Tk"),
          ],
        ),
      ),
    );
  }
}
