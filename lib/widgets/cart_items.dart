import 'package:flutter/material.dart';
import 'package:state_8/providers/cart.dart';

class CartItems extends StatelessWidget {
  final String? id;
  final double? price;
  final int? quantity;
  final String? title;
  CartItems(this.id, this.price, this.quantity, this.title);
  // const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      return Container();
    }
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(child: FittedBox(child: Text('\$$price'))),
          title: Text(title.toString()),
          subtitle: Text('Total: \$${(price! * quantity!)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
