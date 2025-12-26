import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showInfo = true; // toggle Info visibility
  bool showHighlight = false; // toggle Highlights visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Product Image
              Stack(
                children: [
                  Center(
                    child: Image.asset("assets/images/protien.png", height: 300),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 10),
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                ],
              ),

              // 🔹 Product Title and Price
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pooja Flower Mix",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text("200 g", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text("₹49",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        Text(
                          "MRP ₹65",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 🔹 Expandable Info Section
              _expandableSection(
                title: "Info",
                expanded: showInfo,
                onTap: () => setState(() => showInfo = !showInfo),
                child: _infoContent(),
              ),

              // 🔹 Expandable Highlight Section
              _expandableSection(
                title: "Highlights",
                expanded: showHighlight,
                onTap: () => setState(() => showHighlight = !showHighlight),
                child: _highlightContent(),
              ),

              // 🔹 Similar Products
              _similarProducts(),

            ],
          ),
        ),
      ),
    );
  }

  // ---------- Expandable Section ----------
  Widget _expandableSection({
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: child,
            ),
        ],
      ),
    );
  }

  // ---------- Info Content ----------
  Widget _infoContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow("Shelf Life", "3 days"),
        _infoRow("Return Policy",
            "Lorem Ipsum is simply dummy text of the printing industry."),
        _infoRow("Unit", "100 g"),
        _infoRow("Country of Origin", "India"),
        _infoRow("Customer Care Details", "Email: info@grabbo.com"),
        _infoRow("Disclaimer",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        _infoRow(
            "Seller",
            "GRABBO HYPERPURE PRIVATE LIMITED\nA-164 Sec-63 Noida, Gautam Buddha Nagar U.P 201301"),
      ],
    );
  }

  // ---------- Highlight Content ----------
  Widget _highlightContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow("Shelf Life", "3 days"),
        _infoRow("Return Policy",
            "Lorem Ipsum is simply dummy text of the printing industry."),
        _infoRow("Unit", "100 g"),
        _infoRow("Country of Origin", "India"),
        _infoRow("Customer Care Details", "Email: info@grabbo.com"),
      ],
    );
  }

  // ---------- Similar Products ----------
  Widget _similarProducts() {
    final List<String> products = [
      "assets/images/veget.png",
      "assets/images/watch.png",
      "assets/images/onion.jpg",
      "assets/images/oil.jpg",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Similar products",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("See All", style: TextStyle(color: Colors.blue)),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.asset(products[index],
                            height: 100, fit: BoxFit.scaleDown),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Fresh Garland - Orange Marigold",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("₹59  MRP ₹82",
                            style: TextStyle(
                                fontSize: 12, color: Colors.black87)),
                      ),
                      const Spacer(),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green),
                          ),
                          child: const Text("ADD",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Bottom Bar ----------
  Widget _bottomBar() {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("100 g", style: TextStyle(color: Colors.grey)),
              Row(
                children: [
                  Text("₹49",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(width: 6),
                  Text("MRP ₹65",
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough)),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(140, 45),
            ),
            child: const Text("Add to cart",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

// ---------- Info Row ----------
class _infoRow extends StatelessWidget {
  final String label;
  final String value;
  const _infoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 140,
              child: Text(label,
                  style:
                  const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(
              child:
              Text(value, style: const TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}
