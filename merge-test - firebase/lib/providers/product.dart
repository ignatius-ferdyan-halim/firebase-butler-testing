import 'package:flutter/foundation.dart';

//cek lagi, kayaknya ga btuh changenotifier lagi soalnya uda gada fav
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  // bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });
  // this.isFavorite = false});

  // void toggleFavoriteStatus() {
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  // }
}
