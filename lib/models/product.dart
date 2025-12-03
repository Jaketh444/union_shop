class Product {
  final String title;
  final String image;
  final List<String>? images;
  final List<String>? sizes;
  final List<String>? colors;
  final String description;
  final List<String> categories;
  final double price;

  Product({
    required this.title,
    required this.image,
    this.images,
    this.sizes,
    this.colors,
    required this.description,
    required this.categories,
    required this.price,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'image': image,
        'images': images,
        'sizes': sizes,
        'colors': colors,
        'description': description,
        'categories': categories,
        'price': price,
      };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
        title: map['title'],
        image: map['image'],
        images: (map['images'] as List?)?.map((e) => e as String).toList(),
        sizes: (map['sizes'] as List?)?.map((e) => e as String).toList(),
        colors: (map['colors'] as List?)?.map((e) => e as String).toList(),
        description: map['description'],
        categories:
            (map['categories'] as List).map((e) => e as String).toList(),
        price: (map['price'] as num).toDouble(),
      );
}
