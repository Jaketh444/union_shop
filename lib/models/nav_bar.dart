import 'package:flutter/material.dart';

class UnionShopNavBar extends StatelessWidget {
  final BuildContext context;
  const UnionShopNavBar(this.context, {super.key});

  @override
  Widget build(BuildContext ctx) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
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
              if (!isMobile) ...[
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  child: const Text('Shop', style: TextStyle(color: Color(0xFF4d2963))),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/about'),
                  child: const Text('About', style: TextStyle(color: Color(0xFF4d2963))),
                ),
                const SizedBox(width: 24),
              ] else ...[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: PopupMenuButton<int>(
                    icon: const Icon(Icons.menu, color: Color(0xFF4d2963)),
                    onSelected: (value) {
                      if (value == 0) {
                        Navigator.pushNamed(context, '/');
                      } else if (value == 1) {
                        Navigator.pushNamed(context, '/about');
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text('Shop'),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text('About'),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
