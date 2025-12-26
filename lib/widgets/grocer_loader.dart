import 'dart:math';
import 'package:flutter/material.dart';

class GroceryLoader extends StatefulWidget {
  final bool isOverlay;

  const GroceryLoader.initial({super.key}) : isOverlay = false;
  const GroceryLoader.overlay({super.key}) : isOverlay = true;

  @override
  State<GroceryLoader> createState() => _GroceryLoaderState();
}

class _GroceryLoaderState extends State<GroceryLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<String> _images = [
    'assets/images/beauty.png',
    'assets/images/grocery1.png',
    'assets/images/fashion.png',
    'assets/images/pharmacy.png',
    'assets/images/gadget.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loader = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 90,
          width: 90,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Stack(
                alignment: Alignment.center,
                children: List.generate(_images.length, (index) {
                  final angle =
                      (2 * pi / _images.length) * index +
                          (_controller.value * 2 * pi);

                  return Transform.translate(
                    offset: Offset(
                      30 * cos(angle),
                      30 * sin(angle),
                    ),
                    child: Image.asset(
                      _images[index],
                      width: 28,
                      height: 28,
                    ),
                  );
                }),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          "Loading items...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ],
    );

    if (widget.isOverlay) {
      return Container(
        color: Colors.white.withOpacity(0.85),
        child: Center(child: loader),
      );
    }

    return Center(child: loader);
  }
}
