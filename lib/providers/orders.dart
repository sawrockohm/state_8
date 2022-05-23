import 'package:flutter/cupertino.dart';
import 'package:state_8/models/cart_model.dart';
import 'package:state_8/models/order_moder.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];

  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _order.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            product: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
