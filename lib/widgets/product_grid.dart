import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_8/widgets/product_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductS>(context);
    final products = Provider.of<ProductS>(context).item;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2, //ขนาด
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => productItem(products[index].id,
            products[index].title, products[index].imageUrl));
  }
}
