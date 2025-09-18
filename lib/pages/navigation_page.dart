import 'package:flutter/material.dart';
import 'package:grabbo/pages/category_page.dart';
import 'package:grabbo/pages/home_page.dart';
import 'package:grabbo/pages/my_cart_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
   HomePage(),
    CategoriesPage(),
    MyCartPage(),
    const Center(child: Text("👤 Account Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent, // transparent to show container bg
          elevation: 0,
          selectedItemColor: Color(0xffec7d18),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 13,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 26),
              activeIcon: Icon(Icons.home, size: 28),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined, size: 26),
              activeIcon: Icon(Icons.grid_view, size: 28),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, size: 26),
              activeIcon: Icon(Icons.shopping_cart, size: 28),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 26),
              activeIcon: Icon(Icons.person, size: 28),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
