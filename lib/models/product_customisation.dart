import 'package:flutter/material.dart';

class ProductCustomisation extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String?> onSizeChanged;

  final List<String> colours;
  final String selectedColour;
  final ValueChanged<String?> onColourChanged;

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  final VoidCallback? onAddToCart;

  const ProductCustomisation({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeChanged,
    required this.colours,
    required this.selectedColour,
    required this.onColourChanged,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Size: ', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButton<String>(
                value: selectedSize,
                isExpanded: true,
                items: sizes
                    .map((size) => DropdownMenuItem(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: onSizeChanged,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Colour: ', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButton<String>(
                value: selectedColour,
                isExpanded: true,
                items: colours
                    .map((colour) => DropdownMenuItem(
                          value: colour,
                          child: Text(colour),
                        ))
                    .toList(),
                onChanged: onColourChanged,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Quantity: ', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: onDecrease,
            ),
            Text('$quantity', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onIncrease,
            ),
          ],
        ),
        const SizedBox(height: 32),
        Center(
          child: ElevatedButton(
            onPressed: onAddToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Add to Cart'),
          ),
        ),
      ],
    );
  }
}