import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String? title;
  // final double? price;
  // ProductDetailScreen(this.title, this.price);
  static const rountName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final pid = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('title')),
    );
  }
}
