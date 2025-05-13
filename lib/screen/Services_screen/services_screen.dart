import 'package:flutter/material.dart';
// import '../widgets/nav_bar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool showAddServiceForm = false;
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceIdController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();
  final TextEditingController _inventoryController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _shippingController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _serviceNameController.dispose();
    _serviceIdController.dispose();
    _categoriesController.dispose();
    _inventoryController.dispose();
    _discountController.dispose();
    _shippingController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const NavBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: showAddServiceForm
                  ? _buildAddServiceForm()
                  : _buildServicesListView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stats Cards Row
        Row(
          children: [
            _buildStatsCard(
              'Total Sales',
              '\$100,580.83',
              '+25.2%',
              Colors.deepPurple,
            ),
            const SizedBox(width: 16),
            _buildStatsCard(
              'Total Orders',
              '10,587',
              '+42.2%',
              Colors.deepPurple,
            ),
            const SizedBox(width: 16),
            _buildStatsCard('Revenue', '20,580', '+32.7%', Colors.deepPurple),
            const SizedBox(width: 16),
            _buildStatsCard('Visitors', '15,848', '+42.1%', Colors.deepPurple),
            const SizedBox(width: 16),
            _buildStatsCard(
              'Refunded Orders',
              '5,848',
              '+32.1%',
              Colors.deepPurple,
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Services List Header
        Row(
          children: [
            const Text(
              'Services List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAddServiceForm = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: const Text('Add Services'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Services Grid
        Expanded(
          child: GridView.count(
            crossAxisCount: 6,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
            children: [
              _buildServiceCard('Hair Cut', "assets/images/logo.png"),
              _buildServiceCard('Hair Wash', "assets/images/logo.png"),
              _buildServiceCard('Make Up', "assets/images/logo.png"),
              _buildServiceCard('Beard Styling', "assets/images/logo.png"),
              _buildServiceCard('Beard Styling', "assets/images/logo.png"),
              _buildServiceCard('Facial', "assets/images/logo.png"),
              _buildServiceCard('Hair Colouring', "assets/images/logo.png"),
              _buildServiceCard('Pedicure', "assets/images/logo.png"),
              _buildServiceCard('Pedicure', "assets/images/logo.png"),
              _buildServiceCard('Nail Art', "assets/images/logo.png"),
              _buildServiceCard('Hair Spa', "assets/images/logo.png"),
              _buildServiceCard('Threading', "assets/images/logo.png"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddServiceForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAddServiceForm = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: const Text('Add Services'),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side - Form fields
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormField(
                        'Service Name',
                        _serviceNameController,
                        'Facial',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        'Service Id',
                        _serviceIdController,
                        '#45678',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        'Categories',
                        _categoriesController,
                        'Face',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField('Inventory', _inventoryController, '500'),
                      const SizedBox(height: 16),
                      _buildFormField('Discount', _discountController, '20%'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildFormField(
                              'Shipping',
                              _shippingController,
                              'Free Delivery',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildFormField(
                              'Price',
                              _priceController,
                              'BHD 200',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                // Right side - Image preview
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Images',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showAddServiceForm = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.black,
                            ),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Add service logic
                              setState(() {
                                showAddServiceForm = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Service added successfully!'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCard(
    String title,
    String value,
    String percentage,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getIconForTitle(title), color: Colors.grey, size: 16),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                percentage,
                style: const TextStyle(color: Colors.deepPurple, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title) {
      case 'Total Sales':
        return Icons.attach_money;
      case 'Total Orders':
        return Icons.shopping_cart;
      case 'Revenue':
        return Icons.trending_up;
      case 'Visitors':
        return Icons.people;
      case 'Refunded Orders':
        return Icons.assignment_return;
      default:
        return Icons.info;
    }
  }

  Widget _buildServiceCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String hintText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
