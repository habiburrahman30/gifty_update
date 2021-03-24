import 'package:flutter/cupertino.dart';

class Cart {
  String id;
  String title;
  String thumbnail;
  String details;
  String price;
  int quantity;
  String category;

  Cart({
    @required this.id,
    @required this.title,
    @required this.thumbnail,
    @required this.details,
    @required this.price,
    @required this.quantity,
    @required this.category,
  });
}
