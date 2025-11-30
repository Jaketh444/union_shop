import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(context),
          const Expanded(
            child: Center(
              child: Text(
                'Collections',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
            ),
          ),
          const UnionShopFooter(),
        ],
      ),
    );
  }
}