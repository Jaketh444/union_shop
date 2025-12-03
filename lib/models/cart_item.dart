import 'product.dart';

class CartItem {
  final Product product;
  final String? selectedSize;
  final String? selectedColor;
  int quantity;

  CartItem({
    required this.product,
    this.selectedSize,
    this.selectedColor,
    required this.quantity,
  });
}