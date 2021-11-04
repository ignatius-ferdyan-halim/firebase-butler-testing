import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/cart.dart';
import '/Services/database.dart';
import '/Model/user.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String id;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
      {Key key, this.productId, this.id, this.price, this.quantity, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Card(
      key: ValueKey(id),

      // background: Container(
      //   color: Theme.of(context).errorColor,
      //   child: const Icon(
      //     Icons.delete,
      //     color: Colors.white,
      //     size: 40,
      //   ),
      //   alignment: Alignment.centerRight,
      //   padding: const EdgeInsets.only(right: 20),
      //   margin: const EdgeInsets.symmetric(
      //     horizontal: 15,
      //     vertical: 4,
      //   ),
      // ),
      // direction: DismissDirection.endToStart,
      // confirmDismiss: (direction) {
      //   return showDialog(
      //     context: context,
      //     builder: (ctx) => AlertDialog(
      //       title: const Text('Are you sure?'),
      //       content:
      //           const Text('Do you want to remove the item from the cart?'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx).pop(false);
      //           },
      //           child: const Text(
      //             'No',
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         ),
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx).pop(true);
      //           },
      //           child: const Text(
      //             'Yes',
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         )
      //       ],
      //     ),
      //   );
      // },
      // onDismissed: (direction) {
      //   Provider.of<Cart>(context, listen: false).removeItem(productId);
      // },
      // child: Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('Rp. $price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: Rp. ${price * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
    // );
  }
}