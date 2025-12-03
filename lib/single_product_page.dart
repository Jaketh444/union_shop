import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/main.dart'; // for cartItems
import 'package:union_shop/models/cart_item.dart';

class SingleProductPage extends StatefulWidget {
  final Product product;

  const SingleProductPage({super.key, required this.product});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  int selectedImageIndex = 0;
  String? selectedSize;
  String? selectedColor;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final images = widget.product.images ?? [widget.product.image];
    final sizes = widget.product.sizes ?? ['S', 'M', 'L', 'XL'];
    final colors = widget.product.colors ?? ['Black', 'White', 'Purple'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Returns to previous page (single collection)
          },
        ),
        title: const Text('Product Details'),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UnionShopHeader(),
            UnionShopNavBar(context, selectedIndex: 2),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image selector
                  Center(
                    child: Column(
                      children: [
                        images[selectedImageIndex].startsWith('assets/')
                            ? Image.asset(images[selectedImageIndex],
                                height: 220)
                            : Image.network(images[selectedImageIndex],
                                height: 220),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(images.length, (i) {
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedImageIndex = i),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedImageIndex == i
                                        ? Colors.deepPurple
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: images[i].startsWith('assets/')
                                    ? Image.asset(images[i],
                                        height: 48, width: 48)
                                    : Image.network(images[i],
                                        height: 48, width: 48),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.product.title,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.product.description,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  // Size selector
                  Text('Size:',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 8,
                    children: sizes.map((size) {
                      return ChoiceChip(
                        label: Text(size),
                        selected: selectedSize == size,
                        onSelected: (_) => setState(() => selectedSize = size),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  // Color selector
                  Text('Color:',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 8,
                    children: colors.map((color) {
                      return ChoiceChip(
                        label: Text(color),
                        selected: selectedColor == color,
                        onSelected: (_) =>
                            setState(() => selectedColor = color),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '£${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  // Quantity selector
                  Row(
                    children: [
                      const Text('Quantity:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: quantity > 1
                            ? () => setState(() => quantity--)
                            : null,
                      ),
                      Text('$quantity', style: const TextStyle(fontSize: 18)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() => quantity++),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final hasSizes = (widget.product.sizes != null &&
                          widget.product.sizes!.isNotEmpty);
                      final hasColors = (widget.product.colors != null &&
                          widget.product.colors!.isNotEmpty);

                      if ((hasSizes && selectedSize == null) ||
                          (hasColors && selectedColor == null)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please select a size and/or color before adding to cart.')),
                        );
                        return;
                      }

                      cartItems.add(
                        CartItem(
                          product: widget.product,
                          selectedSize: selectedSize,
                          selectedColor: selectedColor,
                          quantity: quantity,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Collection'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(
                            context); // Returns to single collection page
                      },
                    ),
                  ),
                ],
              ),
            ),
            const UnionShopFooter(),
          ],
        ),
      ),
    );
  }
}
