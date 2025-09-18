import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // number of tabs
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffffda73),
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  // 🔹 Logo + Address (scrolls away)
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo & Profile
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.flash_on, color: Colors.black, size: 28),
                                  SizedBox(width: 6),
                                  Text(
                                    "Grabbo",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.person, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          // Address
                          Row(
                            children: const [
                              Icon(Icons.location_on_outlined, color: Colors.black),
                              SizedBox(width: 4),
                              Text(
                                "A Block, Sector 63, Noida",
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Color(0xfffdefc6),
                    elevation: 2,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 70,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.black54),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search "20000 mah powerbank..."',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.mic, color: Colors.black54),
                          ],
                        ),
                      ),
                    ),

                    bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                      tabs: const [
                        Tab(text: "All", icon: Icon(Icons.dashboard,size: 20,)),
                        Tab(text: "Pharmacy", icon: Icon(Icons.local_hospital,size: 20,)),
                        Tab(text: "Electronics", icon: Icon(Icons.devices,size: 20,)),
                        Tab(text: "Fresh", icon: Icon(Icons.apple,size: 20,)),
                        Tab(text: "Fashion", icon: Icon(Icons.checkroom,size: 20,)),
                        Tab(text: "New", icon: Icon(Icons.star_border,size: 20,)),
                      ],
                    ),
                  ),
                ];
              },

              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Banner
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutes.productDetailPage);

                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/slider_image.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // 🔹 Top Categories
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Top Categories",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: [
                          _circleCategory("Watch", "assets/images/watch.png"),
                          _circleCategory("Shirt", "assets/images/watch.png"),
                          _circleCategory("Sports", "assets/images/watch.png"),
                          _circleCategory("Trackpants", "assets/images/watch.png"),
                          _circleCategory("New Trend", "assets/images/watch.png"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Bestseller
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Bestseller",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 4/5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _gridCategory("Vegetables & Fruits", [
                            "assets/images/ginger.png",
                            "assets/images/banana.jpeg",
                            "assets/images/onion.jpg",
                            "assets/images/ginger.png",
                          ], "+172 more"),
                          _gridCategory("Dairy, Bread & Eggs", [
                            "assets/images/amul.webp",
                            "assets/images/bun.jpg",
                            "assets/images/milk.webp",
                            "assets/images/protien.png",
                          ], "+33 more"),
                          _gridCategory("Oil, Ghee & Masala", [
                            "assets/images/oil.jpg",
                            "assets/images/fortune.jpg",
                            "assets/images/aata.webp",
                            "assets/images/protien.png",
                          ], "+226 more"),
                          _gridCategory("Vegetables & Fruits", [
                            "assets/images/protien.png",
                            "assets/images/biscut.webp",
                            "assets/images/onion.jpg",
                            "assets/images/ginger.png",
                          ], "+172 more"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Grocery & Kitchen",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1/1.2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _categoryTile("Vegetables & Fruits", "assets/images/veget.png"),
                          _categoryTile("Atta, Rice & Dal", "assets/images/aata.webp"),
                          _categoryTile("Oil, Ghee & Masala", "assets/images/oil.jpg"),
                          _categoryTile("Dairy, Bread & Eggs", "assets/images/protien.png"),
                          _categoryTile("Dry Fruits & Cereals", "assets/images/ginger.png"),
                          _categoryTile("Bekery & Biscuits", "assets/images/biscut.webp"),
                          _categoryTile("Kitchen Bottle", "assets/images/fortune.jpg"),
                          _categoryTile("Dairy Milk & Milk", "assets/images/amul.webp"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Snacks & Drinks",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        shrinkWrap: true,
                        childAspectRatio: 1/1.2,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _categoryTile("Chips & Namkeen", "assets/images/chips.webp"),
                          _categoryTile("Drinks & Juices", "assets/images/protien.png"),
                          _categoryTile("Tea, Coffee & Milk", "assets/images/milk.webp"),
                          _categoryTile("Sweets & Chocolates", "assets/images/biscut.webp"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _circleCategory(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey.shade100,
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _categoryTile(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: const Color(0xfff1f6ff),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  static Widget _gridCategory(String title, List<String> imagePaths, String more) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 140,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 5/4, // perfect square images
              physics: const NeverScrollableScrollPhysics(),
              children: imagePaths
                  .map(
                    (path) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      path,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration:  BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text(
              more,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: null, // allow wrapping
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
