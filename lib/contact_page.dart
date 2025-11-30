import 'package:flutter/material.dart';
import 'package:union_shop/nav_bar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UnionShopNavBar(context),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'For enquiries, please email us at:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  SelectableText(
                    'shop@upsu.net',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Or visit us at the Students\' Union building.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
