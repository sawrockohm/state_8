import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:state_8/models/order_moder.dart';
import 'dart:math';

class OrderItemW extends StatefulWidget {
  final OrderItem order;
  OrderItemW(this.order);

  @override
  State<OrderItemW> createState() => _OrderItemWState();
}

class _OrderItemWState extends State<OrderItemW> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('\$${widget.order.amount!.toStringAsFixed(2)}'),
          subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime!)),
          trailing: IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.order.product!.length * 20 + 30, 180),
            child: ListView(
              children: widget.order.product!
                  .map((value) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value.title.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${value.quantity}x \$${value.price}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                  .toList(),
            ),
          )
      ]),
    );
  }
}
