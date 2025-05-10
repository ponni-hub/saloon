import 'package:flutter/material.dart';

class AddSalesPage extends StatefulWidget {
  const AddSalesPage({Key? key}) : super(key: key);

  @override
  State<AddSalesPage> createState() => _AddSalesPageState();
}

class _AddSalesPageState extends State<AddSalesPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController =
      TextEditingController(text: "#45678");
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController inventoryController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController shippingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text("Add Sales")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300, // Gray border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Header button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Button background color
                          foregroundColor: Colors.white, // Text color
                        ),
                        child: const Text("Add Sales"),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Sales Name and Shipping
                    Row(
                      children: [
                        Expanded(
                            child:
                                buildTextField("Sales Name", nameController)),
                        const SizedBox(width: 16),
                        Expanded(
                            child:
                                buildTextField("Shipping", shippingController)),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Sales ID and Price
                    Row(
                      children: [
                        Expanded(
                            child: buildTextField("Sales Id", idController)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: buildTextField("Price", priceController)),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Categories and Inventory
                    Row(
                      children: [
                        Expanded(
                            child: buildTextField(
                                "Categories", categoryController)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: buildTextField(
                                "Inventory", inventoryController)),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Discount and Image
                    Row(
                      children: [
                        Expanded(
                            child:
                                buildTextField("Discount", discountController)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Images",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/bty9.jpg"), // replace with your image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Button background color
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Save logic here
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Button background color
                            foregroundColor: Colors.white, // Text color
                          ),
                          child: const Text("Add"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }
}
