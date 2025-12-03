import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Authentication Page',
          style: TextStyle(fontSize: 28, color: Color(0xFF4d2963)),
        ),
      ),
    );
  }
}