import 'package:flutter/material.dart';
import 'sales_screen.dart'; // Adjust if needed

class SalesPayment extends StatelessWidget {
  final List<OrderItem> selectedOrders;

  const SalesPayment({super.key, required this.selectedOrders});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Payment Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
      ],
    );
  }
}
