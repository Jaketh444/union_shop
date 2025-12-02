import 'package:flutter/material.dart';

class ProductCustomisation extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeChanged;

  final List<String> colours;
  final String selectedColour;
  final ValueChanged<String> onColourChanged;

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

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
            DropdownButton<String>(
              value: selectedSize,
              items: sizes
                  .map((size) => DropdownMenuItem(
                        value: size,
                        child: Text(size),
                      ))
                  .toList(),
              onChanged: onSizeChanged,
            ),
          ],
        ),
        Row(
          children: [
            const Text('Colour: ', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: selectedColour,
              items: colours
                  .map((colour) => DropdownMenuItem(
                        value: colour,
                        child: Text(colour),
                      ))
                  .toList(),
              onChanged: onColourChanged,
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
      ],
    );
  }
}