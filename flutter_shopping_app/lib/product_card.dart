import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bgColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgColor,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
            style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('INR $price',
            style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 15),
            Center(child: Image.asset(image, height:250)),
          ],
        ),
    );
  }
}