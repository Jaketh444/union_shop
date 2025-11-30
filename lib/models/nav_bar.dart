import 'package:flutter/material.dart';

class UnionShopNavBar extends StatelessWidget {
  final BuildContext context;
  const UnionShopNavBar(this.context, {super.key});

  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.network(
                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                height: 48,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child:
                const Text('Shop', style: TextStyle(color: Color(0xFF4d2963))),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child:
                const Text('About', style: TextStyle(color: Color(0xFF4d2963))),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
