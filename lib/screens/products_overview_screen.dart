import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_8/models/product.dart';
import 'package:state_8/providers/cart.dart';

import 'package:state_8/providers/products.dart';
import 'package:state_8/widgets/badge.dart';
import '../widgets/product_grid.dart';

enum FliterOption { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myshop'),
        actions: [
          PopupMenuButton(
              onSelected: (FliterOption value) {
                setState(() {
                  if (value == FliterOption.Favorite) {
                    _showOnlyFavorites = true;
                    // productContainer.showFavoritesAll();
                  } else {
                    _showOnlyFavorites = false;
                    // productContainer.showFavoritesOnly();
                  }
                });

                // log(value.toString());
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FliterOption.Favorite,
                      child: Text('Only Favorites'),
                    ),
                    const PopupMenuItem(
                      value: FliterOption.All,
                      child: Text('Show All'),
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, value, ch) =>
                Badge(child: ch, value: value.itemCount.toString()),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
