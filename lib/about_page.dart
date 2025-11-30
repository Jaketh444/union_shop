import 'package:flutter/material.dart';
import 'package:union_shop/nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UnionShopNavBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About the UPSU Shop',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "The UPSU Shop is your one-stop destination for official University of Portsmouth merchandise, gifts, and essentials. We’re proud to offer a wide range of products, from hoodies and t-shirts to stationery and souvenirs, all designed to help you celebrate your university experience.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Our shop is located in the Students’ Union building, making it easy for you to pop in between lectures or while on campus. Whether you’re looking for a gift for a friend, something to remember your time at Portsmouth, or just want to show your university pride, we’ve got you covered.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "All profits from the UPSU Shop go directly back into supporting student activities, services, and events at the University of Portsmouth Students’ Union.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Visit us in person or browse online to find your perfect piece of Portsmouth!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xFF4d2963)),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "UPSU Shop\nUniversity of Portsmouth Students’ Union\nCambridge Road, Portsmouth, PO1 2EF",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.email, color: Color(0xFF4d2963)),
                          SizedBox(width: 12),
                          Expanded(
                            child: SelectableText(
                              "shop@upsu.net",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
