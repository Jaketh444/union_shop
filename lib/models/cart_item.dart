import 'dart:convert';
import 'product.dart';

class CartItem {
  final Product product;
  String? selectedSize;
  String? selectedColor;
  int quantity;

  CartItem({
    required this.product,
    this.selectedSize,
    this.selectedColor,
    required this.quantity,
  });

  Map<String, dynamic> toMap() => {
        'product': product.toMap(),
        'selectedSize': selectedSize,
        'selectedColor': selectedColor,
        'quantity': quantity,
      };

  factory CartItem.fromMap(Map<String, dynamic> map) => CartItem(
        product: Product.fromMap(map['product']),
        selectedSize: map['selectedSize'],
        selectedColor: map['selectedColor'],
        quantity: map['quantity'],
      );
}
