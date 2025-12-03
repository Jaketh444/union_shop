import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class UnionShopScaffold extends StatelessWidget {
  final Widget child;
  final int navIndex;
  final bool showFooter;
  const UnionShopScaffold({
    super.key,
    required this.child,
    this.navIndex = 0,
    this.showFooter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UnionShopHeader(),
            UnionShopNavBar(context, selectedIndex: navIndex),
            child,
            if (showFooter) const UnionShopFooter(),
          ],
        ),
      ),
    );
  }
}
