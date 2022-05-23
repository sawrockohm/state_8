import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_8/providers/orders.dart';
import 'package:state_8/widgets/app_draw.dart';
import 'package:state_8/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const rountName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.order.length,
          itemBuilder: (ctx, i) => OrderItemW(orderData.order[i])),
    );
  }
}
