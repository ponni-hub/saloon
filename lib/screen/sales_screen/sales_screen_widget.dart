import 'package:flutter/material.dart';

class Product {
  final String title;
  final String price;
  final String imageUrl;
  final List<String> weights; // ✅ New field

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.weights,
  });
}

// Section Title Widget
Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Text(title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}

// Horizontal Scrollable Product List
Widget productList(
  List<Product> products,
  Function(Product) onTap, {
  required List<Product> selectedProducts,
}) {
  return SizedBox(
    height: 200, // same height as vertical items
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        final product = products[index];
        final isSelected = selectedProducts.contains(product);

        return GestureDetector(
          onTap: () => onTap(product),
          child: Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.grey.shade100 : Colors.white,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey.shade300,
              ),
            ),
            child: Column(
              children: [
                Image.asset(product.imageUrl, height: 100),
                const SizedBox(height: 8),
                Text(product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(product.price),
              ],
            ),
          ),
        );
      },
    ),
  );
}

// Vertical Scrollable Grid Product List with individual vertical scroll
Widget verticalProductList({
  required List<Product> products,
  required List<Product> selectedProducts,
  required Function(Product) onProductTap,
}) {
  return SizedBox(
    height: 400, // or any height you want
    child: GridView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final isSelected =
            selectedProducts.any((item) => item.title == product.title);

        return GestureDetector(
          onTap: () => onProductTap(product),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.grey.shade100 : Colors.white,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey.shade300,
              ),
            ),
            child: Column(
              children: [
                Image.asset(product.imageUrl, height: 100),
                const SizedBox(height: 8),
                Text(product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(product.price),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget productCard(
  Product product, {
  double imageHeight = 300,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.black,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(product.price,
                    style: TextStyle(color: Colors.grey.shade700)),
              ),
            ],
          ),
        ),
        if (isSelected)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.check, color: Colors.blue, size: 16),
            ),
          ),
      ],
    ),
  );
}
