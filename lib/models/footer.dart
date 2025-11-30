import 'package:flutter/material.dart';

class UnionShopFooter extends StatelessWidget {
  const UnionShopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      padding: const EdgeInsets.all(24),
      child: const Text(
        '© 2025 Union Shop. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}