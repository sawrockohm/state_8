import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String? title;
  // final double? price;
  // ProductDetailScreen(this.title, this.price);
  static const rountName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    // log(productId.toString());
    // log(loadProduct.toString());
    return Scaffold(
      appBar: AppBar(title: Text(loadProduct.title.toString())),
    );
  }
}
