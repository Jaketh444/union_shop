import 'package:flutter/material.dart';

class ProductImageSelector extends StatelessWidget {
  final List<String> images;
  final int selectedImage;
  final ValueChanged<int> onImageSelected;

  const ProductImageSelector({
    super.key,
    required this.images,
    required this.selectedImage,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          images[selectedImage],
          width: 220,
          height: 220,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (i) {
            return GestureDetector(
              onTap: () => onImageSelected(i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedImage == i ? Color(0xFF4d2963) : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Image.network(
                  images[i],
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}