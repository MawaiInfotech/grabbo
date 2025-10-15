import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // ------------------ Scrollable Content ------------------
          SingleChildScrollView(
            child: Column(
              children: [
                // ------------------ Header Section ------------------
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 60, bottom: 30),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFE082), Color(0xFFFFF8E1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 60, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your account',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text('757923194', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 25),

                      // 3 buttons row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _accountButton(Icons.shopping_bag_outlined, "Your Orders"),
                            _accountButton(Icons.chat_bubble_outline, "Help & Support"),
                            _accountButton(Icons.favorite_border, "Your Wishlist"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ------------------ Your Information Section ------------------
                _infoContainer(
                  title: "Your Information",
                  items: [
                    _infoTile(Icons.currency_rupee, "Your Refunds"),
                    _infoTile(Icons.favorite_border, "Your Wishlist"),
                    _infoTile(Icons.card_giftcard, "E-Gift Cards"),
                    _infoTile(Icons.chat_bubble_outline, "Help & Support"),
                    _infoTile(Icons.location_on_outlined, "Saved Addresses"),
                    _infoTile(Icons.person_outline, "Profile"),
                    _infoTile(Icons.card_giftcard_outlined, "Rewards"),
                  ],
                ),

                // ------------------ Payment & Coupons Section ------------------
                _infoContainer(
                  title: "Payment and Coupons",
                  items: [
                    _infoTile(Icons.account_balance_wallet_outlined, "Wallet"),
                    _infoTile(Icons.credit_card, "Payment Settings"),
                    _infoTile(Icons.card_giftcard, "Claim Gift Card"),
                    _infoTile(Icons.card_giftcard_outlined, "Your Collected Rewards"),
                  ],
                ),

                // ------------------ Other Information Section ------------------
                _infoContainer(
                  title: "Other Information",
                  items: [
                    _infoTile(Icons.star_border, "Suggest Products"),
                    _infoTile(Icons.info_outline, "General Info"),
                  ],
                ),

                const SizedBox(height: 30),

                // ------------------ Log Out Button ------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: double.infinity,
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
                    child: TextButton(
                      onPressed: () {
                        // TODO: handle logout
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),

          // ------------------ Fixed Back Arrow (Pinned) ------------------
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.navigationPage);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ Reusable Widgets ------------------

  static Widget _accountButton(IconData icon, String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoContainer({
    required String title,
    required List<Widget> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _sectionTitle(title),
          for (int i = 0; i < items.length; i++) ...[
            if (i != 0) _divider(),
            items[i],
          ],
        ],
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget _divider() => Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey.shade300,
    margin: const EdgeInsets.symmetric(horizontal: 16),
  );

  static Widget _infoTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      onTap: () {},
    );
  }
}
