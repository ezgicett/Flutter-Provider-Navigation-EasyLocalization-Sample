import 'package:badges/badges.dart';
import 'package:dice_app/models/product.dart';
import 'package:dice_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import 'cart_page.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({Key? key}) : super(key: key);

  List<Product> products = [
    Product(LocaleKeys.apple.tr(), "assets/images/apple.jpg", 10),
    Product(LocaleKeys.watermelon.tr(), "assets/images/watermelon.jpg", 15),
    Product(LocaleKeys.banana.tr(), "assets/images/banana.jpg", 5),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(LocaleKeys.shoppingList.tr()),
          backgroundColor: const Color(0XFF2e3438),
          actions: [
            Center(
              child: Badge(
                badgeContent: Consumer<Cart>(
                  builder: (context, cart, child) => Text('${cart.itemCount}'),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_basket),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              products.isEmpty
                  ? Text(LocaleKeys.noItemOnTheList.tr())
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.asset(
                                    products[index].imagePath.toString()),
                                title: Text(products[index].name.toString()),
                                subtitle: Text(
                                    products[index].price.toString() + " Euro"),
                                trailing: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    addToBasket(context, products[index]);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void addToBasket(BuildContext context, Product item) {
    var cart = context.read<Cart>();
    cart.increment(item);
  }
}
