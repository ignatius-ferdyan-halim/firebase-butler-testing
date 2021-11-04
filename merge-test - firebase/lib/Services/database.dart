import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/orders.dart';
import '/providers/cart.dart';
import '/Model/order_data.dart';
// import '/widgets/cart_item.dart';

class DatabaseService {
  final cart = Cart();
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference cartCollection =
      Firestore.instance.collection('Cart');

  Future updateUserData(
    double amount,
    // var products,
  ) async {
    return await cartCollection.document(uid).setData({
      'id': DateTime.now().toString(),
      'amount': amount,
      // 'products': products,
      'dateTime': DateTime.now(),
    });
  }

  Future updateUserCart(
    String id,
    int count,
    String title,
    double total,
    int quantity,
  ) async {
    // DocumentReference docRef = cartCollection.document(uid);
    // DocumentSnapshot docSnap = await docRef.get();
    // Map<String, dynamic> docData = docSnap.data;
    // List<Map<String, dynamic>> products = (docData['products'] as List<dynamic>)
    //     .map((products) => Map<String, dynamic>.from(products))
    //     .toList();
    Map<String, Object> products = {
      'id': id,
      'total': total,
      'quantity': quantity,
      'title': title,
    };
    // int i;
    // for (i = 0; i < count; i++) {}
    await cartCollection.document(uid).updateData({'Products $id': products});
    // final productsData = products[0];
    // final productsList = productsData.values.toList();
  }
}
