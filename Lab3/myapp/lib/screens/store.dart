import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/data.dart';
import 'package:myapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Store extends StatelessWidget {
  static const String routeName = '/shop';

  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items.elementAt(index).name),
                  subtitle: Text(items.elementAt(index).price.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .removeItem(items.elementAt(index));
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              "Total Price : " +
                  NumberFormat("0.00", "en_US")
                      .format(Provider.of<CartProvider>(context).total)
                      .toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
