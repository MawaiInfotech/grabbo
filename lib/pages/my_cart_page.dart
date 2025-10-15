import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite_border, color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  _cartItem(
                    image: 'assets/images/aata.webp',
                    name: 'Ashirvaad atta',
                    qty: '5 kg',
                    price: 59,
                    oldPrice: 80,
                    count: 2,
                  ),
                  _cartItem(
                    image: 'assets/images/chips.webp',
                    name: 'Chips',
                    qty: '1 pc',
                    price: 266,
                    oldPrice: 490,
                    count: 1,
                  ),
                  _cartItem(
                    image: 'assets/images/biscut.webp',
                    name: 'Biscuit',
                    qty: '1 Pc',
                    price: 54,
                    oldPrice: 84,
                    count: 1,
                  ),
                  const SizedBox(height: 12),
                  _billSummary(),
                  const SizedBox(height: 8),
                  _couponSection(),
                  const SizedBox(height: 8),
                  _tipSection(),
                  const Divider(height: 1),
                  _instructionSection(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          _bottomPayButton(),
        ],
      ),
    );
  }

  Widget _cartItem({
    required String image,
    required String name,
    required String qty,
    required int price,
    required int oldPrice,
    required int count,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image, width: 40, height: 40, fit: BoxFit.scaleDown),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 3),
                    Text(qty, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfffce9ff),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.purple,width: 0.3),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.remove, size: 16, color: Colors.purple),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text('$count',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14)),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.add, size: 16, color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('₹$price',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      Text('₹$oldPrice',
                          style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12
                          ),),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _billSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children:  [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                  child: Icon(Icons.receipt_long_outlined, color: Colors.black54)),
              SizedBox(width: 10),
              Expanded(
                child: Text('Bill summary',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              Text('₹387.99',
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 13)),
              SizedBox(width: 4),
              Text('₹230',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
          const Divider(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Item amount'),
              Row(
                children: [
                  Text('₹388', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 5),
                  Text('₹230',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery charge'),
              Row(
                children: [
                  Text('₹30', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 5),
                  Text('FREE', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount'),
              Text('₹158'),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text('₹230',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _couponSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffe8f6ee),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.percent, color: Colors.white),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text('You have 3 Coupon',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w700)),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Apply',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }

  Widget _tipSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.volunteer_activism_outlined, color: Colors.black54),
          const SizedBox(width: 10),
          const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery Partner Tip',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 2),
                  Text('This amount goes to your delivery partner',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              )),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _instructionSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.chat_outlined, color: Colors.black54),
          const SizedBox(width: 10),
          const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery Instructions',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 2),
                  Text('Delivery partner will be notified',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              )),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _bottomPayButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffa93cff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {},
          child: const Text(
            'Click to Pay ₹230',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
