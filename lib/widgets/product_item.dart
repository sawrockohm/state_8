import 'package:flutter/material.dart';

import '../screens/product_detail.dart';

class productItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  productItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.rountName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
