import 'package:flutter/material.dart';

import '../models/product.dart';

class Cart with ChangeNotifier {
  List<Product> itemsOnList = [];
  int price = 0;
  int itemCount = 0;

  void increment(Product product) {
    if (itemsOnList.contains(product))
      product.selectedCount++;
    else
      itemsOnList.add(product);
    price += product.price!;
    itemCount++;
    notifyListeners();
  }

  void deleteItem(Product product) {
    itemCount -= (product.selectedCount);
    price -= (product.price! * product.selectedCount);
    product.selectedCount = 1;
    itemsOnList.remove(product);
    notifyListeners();
  }
}
