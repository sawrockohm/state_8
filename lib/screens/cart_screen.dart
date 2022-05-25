import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_8/providers/cart.dart';
import 'package:state_8/providers/orders.dart';
import 'package:state_8/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  static const rountName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('CartScreen');
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                Chip(
                  label: Consumer<Cart>(
                    builder: (ctx, totalAmount, _) => Text(
                      '\$${totalAmount.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium!
                              .color),
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  onPressed: () {
                    log(cart.item.values.toList().toString());
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cart.item.values.toList(), cart.totalAmount);
                    cart.clear();
                  },
                  child: const Text('Order Now'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                // physics: BouncingScrollPhysics(),
                itemCount: cart.item.length,
                itemBuilder: (ctx, index) => CartItems(
                      cart.item.values.toList()[index].id,
                      cart.item.keys.toList()[index],
                      cart.item.values.toList()[index].price,
                      cart.item.values.toList()[index].quantity,
                      cart.item.values.toList()[index].title,
                      // '${cart.item[keys[index]]}',
                      // cart.item[keys[index]]!.price!,
                      // cart.item[keys[index]]!.quantity!,
                      // '${cart.item[keys[index]]?.title}')
                    )))
      ]),
    );
  }
}
