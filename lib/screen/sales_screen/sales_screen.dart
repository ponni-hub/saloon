import 'package:flutter/material.dart';
import 'package:saloon_app/screen/sales_screen/sales_screen_widget.dart';
import 'package:saloon_app/screen/sales_screen/sales_payment.dart';

class OrderItem {
  final Product product;
  int quantity;

  OrderItem({required this.product, this.quantity = 1});
}

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final List<Product> popularSales = [
    Product(
        title: 'Shampoo',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'title1',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'title2',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'title5',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'title6',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'title4',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'test',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'dfghth',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'fedgtb',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
  ];

  final List<Product> beautyProducts = [
    Product(
        title: 'vgbrb',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'vgngxdf',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'dfgyrnb',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'gfvhtn',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'fvtyhy',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'bcdskjj',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'cbjsfhj',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'cbdjfh',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'cfsj',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'csbjhfbe',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'cdnkje',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'cbdjfh',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'ndknk',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
    Product(
        title: 'xnbhvjh',
        price: 'BHD 150.00/-',
        imageUrl: 'assets/images/smoothies.jpg'),
  ];

  List<OrderItem> selectedOrders = [];
  bool showPaymentView = false;

  void onProductSelected(Product product) {
    setState(() {
      final index = selectedOrders
          .indexWhere((item) => item.product.title == product.title);
      if (index != -1) {
        selectedOrders.removeAt(index);
      } else {
        selectedOrders.add(OrderItem(product: product));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> selectedProducts =
        selectedOrders.map((e) => e.product).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      sectionTitle('Popular Sales'),
                      productList(
                        popularSales,
                        onProductSelected,
                        selectedProducts: selectedProducts,
                      ),
                      sectionTitle('Beauty Products'),
                      verticalProductList(
                        products: beautyProducts,
                        selectedProducts: selectedProducts,
                        onProductTap: onProductSelected,
                      ),
                    ],
                  ),
                ),
                if (selectedOrders.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: showPaymentView
                          ? Column(
                              children: [
                                const Text("Payment",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: ListView(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                Text("Items",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text("Nos",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text("Rate",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            rowItem(
                                                "Face cream", "2", "BHD.300"),
                                            rowItem("Lipstck", "5", "BHD.750"),
                                            const SizedBox(height: 10),
                                            rowItem("GST", "", "BHD.250"),
                                            const Divider(),
                                            rowItem("Total", "7", "BHD.1300"),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Text("Home Service",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Payment Method",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                paymentOption(
                                                    Icons.money, true),
                                                paymentOption(
                                                    Icons
                                                        .account_balance_wallet,
                                                    false),
                                                paymentOption(
                                                    Icons.language, false),
                                                paymentOption(
                                                    Icons.credit_card, false),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Center(
                                        child: Text("Download Invoice",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showPaymentView = false;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text("Back"),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Orders",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Container(
                                  height:
                                      300, // ✅ Fix: Give height instead of using Expanded
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListView.builder(
                                    itemCount: selectedOrders.length,
                                    itemBuilder: (context, index) {
                                      final item = selectedOrders[index];
                                      return ListTile(
                                        leading: Image.asset(
                                            item.product.imageUrl,
                                            width: 40),
                                        title: Text(item.product.title),
                                        subtitle: Text("Qty: ${item.quantity}"),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.remove_circle),
                                          onPressed: () {
                                            setState(() {
                                              selectedOrders.removeAt(index);
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showPaymentView = true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text("Next"),
                                ),
                              ],
                            ),
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget rowItem(String item, String nos, String rate) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(item), Text(nos), Text(rate)],
    ),
  );
}

Widget paymentOption(IconData icon, bool selected) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 36),
      ),
      const SizedBox(height: 5),
      Icon(
        Icons.radio_button_checked,
        color: selected ? Colors.blue : Colors.grey,
        size: 16,
      ),
    ],
  );
}
