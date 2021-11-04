import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cart.dart' show Cart;
//show buat ngasi tau cm butuh Cart class
import '/widgets/cart_item.dart';
import '/providers/orders.dart';
import 'order_screen.dart';
import '/Services/database.dart';
import '/Model/user.dart';
import '/Model/order_data.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final user = Provider.of<User>(context);
    final order = Provider.of<Datas>(context);
    final cartItem = CartItem();
    final total = cart.totalAmount;

    for (int i = 0; i < cart.itemCount; i++) {
      // CartItem(
      //     productId: cart.items.keys.toList()[i],
      //     id: cart.items.values.toList()[i].id,
      //     title: cart.items.values.toList()[i].title,
      //     quantity: cart.items.values.toList()[i].quantity,
      //     price: cart.items.values.toList()[i].price);
      // DatabaseService(uid: user.uid).updateUserCart(
      //     cart.items.keys.toList()[i],
      //     cart.itemCount,
      //     cart.items.values.toList()[i].title,
      //     cart.items.values.toList()[i].price *
      //         cart.items.values.toList()[i].quantity,
      //     cart.items.values.toList()[i].quantity);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'Rp. ${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () async {
                      // Provider.of<Datas>(context, listen: false)
                      //     .addData(cart.items.values.toList());
                      //adddata provider diatas jadinya bikin kalo user pencet order now di cart,
                      //harusnya keapus, karena pas pencet tombol itu, updateUSerData bakal aktif, dan disitu
                      //gada list dari pemesanan, nah tapi karena berkat provider diatas
                      //dia jadi nyimpen, soalnya provider diatas itu dia make list dari cartitem jg
                      //yang nyimpen data dari pemesanan. makanya kalo liat dari
                      //firestorenya, dia ngapus dulu, terus muncul lagi data pemesananya
                      //msh ad anehnya, knp dia mncul lg pdhl blm aktif lagi function database service nya
                      //soalnya stelah order now kan lgsg ke page order(history)
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );

                      await DatabaseService(uid: user.uid)
                          .updateUserData(total);
                      cart.clear();

                      Navigator.of(context).pushNamed(OrderScreen.routeName);
                      // cobacoba();
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                  productId: cart.items.keys.toList()[i],
                  id: cart.items.values.toList()[i].id,
                  title: cart.items.values.toList()[i].title,
                  quantity: cart.items.values.toList()[i].quantity,
                  price: cart.items.values.toList()[i].price),
              itemCount: cart.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
