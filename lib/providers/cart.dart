import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:state_8/models/cart_model.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  void addItem(String pId, double price, String title) {
    if (_items.containsKey(pId)) {
      log('containsKey');
      _items.update(
          pId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity! + 1,
              price: value.price));
    } else {
      log('putIfAbsent');
      _items.putIfAbsent(
        pId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  int get itemCount {
    // log(_items['p2']!.quantity.toString());
    return _items.length;
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, value) {
      total += value.price! * value.quantity!;
    });
    return total;
  }
}
