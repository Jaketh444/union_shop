import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          final horizontalPadding = isMobile ? 12.0 : 24.0;
          final verticalPadding = isMobile ? 16.0 : 32.0;
          final titleFontSize = isMobile ? 20.0 : 28.0;
          final bodyFontSize = isMobile ? 14.0 : 16.0;
          final infoFontSize = isMobile ? 13.0 : 15.0;
          final sectionSpacing = isMobile ? 16.0 : 24.0;
          final blockSpacing = isMobile ? 20.0 : 32.0;

          return Column(
            children: [
              const UnionShopHeader(),
              UnionShopNavBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About the UPSU Shop',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4d2963),
                          ),
                        ),
                        SizedBox(height: sectionSpacing),
                        Text(
                          "The UPSU Shop is your one-stop destination for official University of Portsmouth merchandise, gifts, and essentials. We’re proud to offer a wide range of products, from hoodies and t-shirts to stationery and souvenirs, all designed to help you celebrate your university experience.",
                          style: TextStyle(fontSize: bodyFontSize, height: 1.5),
                        ),
                        SizedBox(height: sectionSpacing),
                        Text(
                          "Our shop is located in the Students’ Union building, making it easy for you to pop in between lectures or while on campus. Whether you’re looking for a gift for a friend, something to remember your time at Portsmouth, or just want to show your university pride, we’ve got you covered.",
                          style: TextStyle(fontSize: bodyFontSize, height: 1.5),
                        ),
                        SizedBox(height: sectionSpacing),
                        Text(
                          "All profits from the UPSU Shop go directly back into supporting student activities, services, and events at the University of Portsmouth Students’ Union.",
                          style: TextStyle(fontSize: bodyFontSize, height: 1.5),
                        ),
                        SizedBox(height: blockSpacing),
                        Text(
                          "Visit us in person or browse online to find your perfect piece of Portsmouth!",
                          style: TextStyle(
                              fontSize: bodyFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: blockSpacing),
                        Container(
                          padding: EdgeInsets.all(isMobile ? 10 : 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Color(0xFF4d2963)),
                              SizedBox(width: isMobile ? 8 : 12),
                              Expanded(
                                child: Text(
                                  "UPSU Shop\nUniversity of Portsmouth Students’ Union\nCambridge Road, Portsmouth, PO1 2EF",
                                  style: TextStyle(fontSize: infoFontSize),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sectionSpacing),
                        Container(
                          padding: EdgeInsets.all(isMobile ? 10 : 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.email, color: Color(0xFF4d2963)),
                              SizedBox(width: isMobile ? 8 : 12),
                              Expanded(
                                child: SelectableText(
                                  "shop@upsu.net",
                                  style: TextStyle(
                                      fontSize: infoFontSize,
                                      color: Colors.blue),
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
              const UnionShopFooter(),
            ],
          );
        },
      ),
    );
  }
}
