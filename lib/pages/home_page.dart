import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage>{
    String _currentAddress = "Select Address"; // default address

    void updateAddress(String newAddress) {
      setState(() {
        _currentAddress = newAddress;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.flash_on, color: Colors.black, size: 28),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Grabbo",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            // Show dialog
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              builder: (context) => SelectLocationDialog(
                                onLocationSelected: updateAddress,
                              ),
                            );
                          },
                          child: Text(
                            _currentAddress,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.black),
                    )
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search "20000 mah powerbank"...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Category Row
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _categoryIcon(Icons.apps, "All"),
                    _categoryIcon(Icons.local_pharmacy, "Pharmacy"),
                    _categoryIcon(Icons.devices, "Electronics"),
                    _categoryIcon(Icons.eco, "Fresh"),
                    _categoryIcon(Icons.checkroom, "Fashion"),
                    _categoryIcon(Icons.new_releases, "New"),
                  ],
                ),
              ),

              // Banner
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 150,
                    color: Colors.green.shade700,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset("assets/images/banner.png",
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow),
                            onPressed: () {},
                            child: const Text("Shop now",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Top Categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Top Categories",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _circleCategory("T-Shirt", "assets/images/tshirt.png"),
                    _circleCategory("Shirt", "assets/images/shirt.png"),
                    _circleCategory("Sports", "assets/images/shoes.png"),
                    _circleCategory("Trackpants", "assets/images/pants.png"),
                    _circleCategory("New Trend", "assets/images/watch.png"),
                  ],
                ),
              ),

              // Bestseller
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Bestseller",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1,
                  children: [
                    _bestsellerCard("Vegetables & Fruits", "+172 more"),
                    _bestsellerCard("Dairy, Bread & Eggs", "+33 more"),
                    _bestsellerCard("Oil, Ghee & Masala", "+226 more"),
                    _bestsellerCard("Snacks & Biscuits", "+120 more"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectLocationDialog extends StatelessWidget {
  final Function(String) onLocationSelected;
  const SelectLocationDialog({super.key, required this.onLocationSelected});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Select Location",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Search
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search Address",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Options
                ListTile(
                  leading: const Icon(Icons.my_location, color: Colors.pink),
                  title: const Text("Use my Current Location"),
                  onTap: () async {
                    try {
                      final position = await _getCurrentLocation();

                      // Reverse Geocoding
                      final placemarks = await placemarkFromCoordinates(
                        position.latitude,
                        position.longitude,
                      );

                      String address = "Lat: ${position.latitude}, Lng: ${position.longitude}";
                      if (placemarks.isNotEmpty) {
                        final place = placemarks.first;
                        address =
                        "${place.street}, ${place.locality}, ${place.administrativeArea}";
                      }

                      onLocationSelected(address); // ✅ update in HomePage
                      Navigator.pop(context); // close dialog
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: $e")),
                      );
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add, color: Colors.pink),
                  title: const Text("Add New Address"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {},
                ),

                const SizedBox(height: 20),
                const Text("Saved Addresses",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // Saved Addresses
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.apartment),
                    title: const Text("Work • 7 m"),
                    subtitle: const Text(
                        "A-164, mawai Infotech Ltd, Sector 63, A Block, Block A, Noida"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Chip(
                          label: Text("Selected"),
                          backgroundColor: Colors.greenAccent,
                          labelStyle: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.share),
                        SizedBox(width: 8),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home • 4.2 km"),
                    subtitle: const Text(
                        "ug 2, 1531, Sector 5, Vasundhara, Ghaziabad, 1531, Sector 5, Vasundhara"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.share),
                        SizedBox(width: 8),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<Position> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // Get current position
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}


// Category icon widget
class _categoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _categoryIcon(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Circle category (Top Categories)
class _circleCategory extends StatelessWidget {
  final String title, image;
  const _circleCategory(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Bestseller card
Widget _bestsellerCard(String title, String more) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                4,
                    (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )),
          ),
        ),
        const SizedBox(height: 6),
        Text(more, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    ),
  );
}