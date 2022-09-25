import 'package:dice_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(LocaleKeys.shoppingCart.tr()),
          backgroundColor: Colors.amber,
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) => cart.itemsOnList.isEmpty
              ? Text(LocaleKeys.noItemOnTheList.tr())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.itemsOnList.length,
                  itemBuilder: (context, index) {
                    final item = cart.itemsOnList[index];
                    return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: Key(item.name.toString()),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        var cart = context.read<Cart>();
                        cart.deleteItem(cart.itemsOnList[index]);
                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$item dismissed')));
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(color: Colors.red),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                  cart.itemsOnList[index].imagePath.toString()),
                              title:
                                  Text(cart.itemsOnList[index].name.toString()),
                              subtitle: Text(
                                  cart.itemsOnList[index].price.toString() +
                                      " Euro"),
                              trailing: Text(cart
                                  .itemsOnList[index].selectedCount
                                  .toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Consumer<Cart>(
            builder: (context, cart, child) =>
                Text(LocaleKeys.pay.tr() + ': ' + cart.price.toString()),
          ),
          icon: const Icon(Icons.payment),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
