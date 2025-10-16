import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xffffda73),  Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // 🔹 App Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:  [
                          Icon(Icons.flash_on, color: Colors.purple, size: 28),
                          SizedBox(width: 8),
                          Text(
                            "Grabbo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    //  const Icon(Icons.shopping_cart_outlined, color: Colors.black54),
                    ],
                  ),
                ),
              ),

              // 🔹 Search Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search "20000 mah powerbank"...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.mic),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              // 🔹 Category Section 1
              SliverToBoxAdapter(child: _categoryTitle("Grocery & Kitchen")),
              _buildCategoryGrid([
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.subCategoryPage);
                  },
                    child: _categoryItem("Vegetables & Fruits", "assets/images/fortune.jpg")),
                _categoryItem("Atta, Rice & Dal", "assets/images/oil.jpg"),
                _categoryItem("Oil, Ghee & Masala", "assets/images/onion.jpg"),
                _categoryItem("Dairy, Bread & Eggs", "assets/images/aata.webp"),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.subCategoryPage);
                    },
                    child: _categoryItem("Vegetables & Fruits", "assets/images/fortune.jpg"),
                ),
                _categoryItem("Atta, Rice & Dal", "assets/images/oil.jpg"),
                _categoryItem("Oil, Ghee & Masala", "assets/images/onion.jpg"),
                _categoryItem("Dairy, Bread & Eggs", "assets/images/aata.webp"),
              ]),

              // 🔹 Category Section 2
              SliverToBoxAdapter(child: _categoryTitle("Snacks & Drinks")),
              _buildCategoryGrid([
                _categoryItem("Dry Fruits & More", "assets/images/chips.webp"),
                _categoryItem("Biscuits & Cakes", "assets/images/biscut.webp"),
                _categoryItem("Cold Drinks & Juices", "assets/images/protien.png"),
                _categoryItem("Tea, Coffee & Health Drinks", "assets/images/amul.webp"),
              ]),

              // 🔹 Category Section 3
              SliverToBoxAdapter(child: _categoryTitle("Home & Cleaning")),
              _buildCategoryGrid([
                _categoryItem("Bath & Body", "assets/images/ginger.png"),
                _categoryItem("Home Essentials", "assets/images/milk.webp"),
                _categoryItem("Snacks & Chips", "assets/images/chips.webp"),
                _categoryItem("Sweets & Chocolates", "assets/images/banana.jpeg"),
              ]),

              SliverToBoxAdapter(child: _categoryTitle("Grocery & Kitchen")),
              _buildCategoryGrid([
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.subCategoryPage);
                    },
                    child: _categoryItem("Vegetables & Fruits", "assets/images/fortune.jpg")),
                _categoryItem("Atta, Rice & Dal", "assets/images/oil.jpg"),
                _categoryItem("Oil, Ghee & Masala", "assets/images/onion.jpg"),
                _categoryItem("Dairy, Bread & Eggs", "assets/images/aata.webp"),
              ]),

              // 🔹 Category Section 2
              SliverToBoxAdapter(child: _categoryTitle("Snacks & Drinks")),
              _buildCategoryGrid([
                _categoryItem("Dry Fruits & More", "assets/images/chips.webp"),
                _categoryItem("Biscuits & Cakes", "assets/images/biscut.webp"),
                _categoryItem("Cold Drinks & Juices", "assets/images/protien.png"),
                _categoryItem("Tea, Coffee & Health Drinks", "assets/images/amul.webp"),
              ]),

              // 🔹 Category Section 3
              SliverToBoxAdapter(child: _categoryTitle("Home & Cleaning")),
              _buildCategoryGrid([
                _categoryItem("Bath & Body", "assets/images/ginger.png"),
                _categoryItem("Home Essentials", "assets/images/milk.webp"),
                _categoryItem("Snacks & Chips", "assets/images/chips.webp"),
                _categoryItem("Sweets & Chocolates", "assets/images/banana.jpeg"),
              ]),

              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Widget: Category Title
  Widget _categoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // 🔸 Widget: Single Category Item
  Widget _categoryItem(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 50),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  // 🔸 Widget: Category Grid (Reusable)
  SliverPadding _buildCategoryGrid(List<Widget> children) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildListDelegate(children),
      ),
    );
  }
}
