import 'product.dart';

class CartItem {
  final Product product;
  String? selectedSize; // Remove 'final' so these can be updated
  String? selectedColor;
  int quantity;

  CartItem({
    required this.product,
    this.selectedSize,
    this.selectedColor,
    required this.quantity,
  });
}
