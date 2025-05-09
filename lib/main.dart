import 'package:flutter/material.dart';
import 'package:saloon_app/screen/sales_screen/sales_addsales.dart';
import 'package:saloon_app/screen/sales_screen/sales_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sales Dashboard',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMenu = 'Dashboard';

  Widget _getSelectedPage() {
    switch (selectedMenu) {
      case 'Dashboard':
        return const Center(
            child: Text('Dashboard Page', style: TextStyle(fontSize: 24)));
      case 'Sale':
        return SalesScreen();
      case 'Calendar':
        return const Center(
            child: Text('Calendar Page', style: TextStyle(fontSize: 24)));
      case 'Clients':
        return const Center(
            child: Text('Clients Page', style: TextStyle(fontSize: 24)));
      case 'Services':
        return const Center(
            child: Text('Services Page', style: TextStyle(fontSize: 24)));
      case 'Messages':
        return const Center(
            child: Text('Messages Page', style: TextStyle(fontSize: 24)));
      case 'AddSale':
        return const AddSalesPage();
      default:
        return const Center(
            child: Text('Welcome', style: TextStyle(fontSize: 24)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopMenuBar(
            selectedMenu: selectedMenu,
            onMenuSelected: (value) {
              setState(() {
                selectedMenu = value;
              });
            },
          ),
          Expanded(child: _getSelectedPage()),
        ],
      ),
    );
  }
}

class MenuItem {
  final String name;
  final IconData icon;

  MenuItem({required this.name, required this.icon});
}

class TopMenuBar extends StatefulWidget {
  final String selectedMenu;
  final Function(String) onMenuSelected;

  const TopMenuBar({
    super.key,
    required this.selectedMenu,
    required this.onMenuSelected,
  });

  @override
  State<TopMenuBar> createState() => _TopMenuBarState();
}

class _TopMenuBarState extends State<TopMenuBar> {
  final List<MenuItem> menuItems = [
    MenuItem(name: 'Dashboard', icon: Icons.dashboard),
    MenuItem(name: 'Sale', icon: Icons.shopping_bag),
    MenuItem(name: 'Calendar', icon: Icons.calendar_today),
    MenuItem(name: 'Clients', icon: Icons.people),
    MenuItem(name: 'Services', icon: Icons.design_services),
    MenuItem(name: 'Messages', icon: Icons.message),
  ];

  OverlayEntry? _overlayEntry;
  final LayerLink _saleLink = LayerLink();
  bool isDropdownOpen = false;
  void _showSaleDropdown(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 150,
        child: CompositedTransformFollower(
          link: _saleLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 40),
          child: Material(
            elevation: 4,
            color: const Color.fromARGB(
                255, 252, 251, 251), // Set background color here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    "Add Sales",
                    style: TextStyle(color: Colors.blue), // White text
                  ),
                  onTap: () {
                    _removeDropdown();
                    widget.onMenuSelected('AddSale');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    isDropdownOpen = true;
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    isDropdownOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              FlutterLogo(),
              SizedBox(width: 10),
              Text(
                'Joz',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: menuItems.map((item) {
              final isActive = item.name == widget.selectedMenu;
              Widget menuItem;
              if (item.name == 'Sale') {
                menuItem = CompositedTransformTarget(
                  link: _saleLink,
                  child: GestureDetector(
                    onTap: () {
                      if (isDropdownOpen) {
                        _removeDropdown();
                        widget.onMenuSelected('Sale');
                      } else {
                        _showSaleDropdown(context);
                      }
                    },
                    child: _buildMenuItem(item, isActive),
                  ),
                );
              } else {
                menuItem = GestureDetector(
                  onTap: () {
                    _removeDropdown();
                    widget.onMenuSelected(item.name);
                  },
                  child: _buildMenuItem(item, isActive),
                );
              }
              return Row(children: [menuItem, const SizedBox(width: 35)]);
            }).toList(),
          ),
          Row(
            children: const [
              Icon(Icons.notifications_none, color: Colors.black),
              SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: [
          Icon(
            item.icon,
            color: isActive ? Colors.blue : Colors.black,
            size: 20,
          ),
          const SizedBox(width: 6),
          Text(
            item.name,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? Colors.blue : Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }
}
