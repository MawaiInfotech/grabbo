import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
  const SubCategoryPage({super.key});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"name": "All", "icon": "assets/images/veget.png"},
    {"name": "Breakfast", "icon": "assets/images/milk.webp"},
    {"name": "Fresh Vegetables", "icon": "assets/images/onion.jpg"},
    {"name": "New Launches", "icon": "assets/images/protien.png"},
    {"name": "Dry fruits", "icon": "assets/images/banana.jpeg"},
    {"name": "Fresh Fruits", "icon": "assets/images/ginger.png"},
    {"name": "Flowers & Leaves", "icon": "assets/images/chips.webp"},
    {"name": "Leafy, Herbs", "icon": "assets/images/aata.webp"},
  ];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Apple Shimla",
      "image": "assets/images/biscut.webp",
      "price": 152,
      "mrp": 220,
      "weight": "1 pack (400 g)"
    },
    {
      "name": "Green Chilli",
      "image": "assets/images/bun.jpg",
      "price": 15,
      "mrp": 30,
      "weight": "1 pack (200 g)"
    },
    {
      "name": "Organic Ginger",
      "image": "assets/images/ginger.png",
      "price": 80,
      "mrp": 120,
      "weight": "1 pack (250 g)"
    },
    {
      "name": "Apple Shimla",
      "image": "assets/images/biscut.webp",
      "price": 152,
      "mrp": 220,
      "weight": "1 pack (400 g)"
    },
    {
      "name": "Green Chilli",
      "image": "assets/images/bun.jpg",
      "price": 15,
      "mrp": 30,
      "weight": "1 pack (200 g)"
    },
    {
      "name": "Organic Ginger",
      "image": "assets/images/ginger.png",
      "price": 80,
      "mrp": 120,
      "weight": "1 pack (250 g)"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("All Categories",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black, size: 28),
          )
        ],
      ),
      body: Row(
        children: [
          // Left Category List
          Container(
            width: 100,
            color: Colors.white,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Container(
                     margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFFFF2D9)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(categories[index]['icon']),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          categories[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Right Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 240,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: const Offset(0, 1))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image + Favorite + ADD button
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                product['image'],
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Positioned(
                              right: 6,
                              top: 6,
                              child: Icon(Icons.favorite_border,
                                  color: Colors.redAccent),
                            ),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  "ADD",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Product Details
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("₹${product['price']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  const SizedBox(width: 6),
                                  Text(
                                    "₹${product['mrp']}",
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        decoration:
                                        TextDecoration.lineThrough
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(product['weight'],
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 11)),
                              const SizedBox(height: 3),
                              Text(product['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
