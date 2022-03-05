import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/data.dart';
import 'package:myapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canAddToCart = !Provider.of<CartProvider>(context).isItemAdded(item);

    return Card(
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              item.image,
            ),
          ),
          Text(item.name, style: Theme.of(context).textTheme.headline6),
          Text(
            NumberFormat("0.00", "en_US").format(item.price).toString(),
            style: Theme.of(context).textTheme.caption,
          ),
          IconButton(
              onPressed: canAddToCart
                  ? () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(item);
                    }
                  : null,
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
    );
  }
}
