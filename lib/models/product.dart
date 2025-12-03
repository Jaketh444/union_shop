class Product {
  final String title;
  final String image;
  final List<String>? images;      // Add this for multiple images
  final List<String>? sizes;       // Add this for size options
  final List<String>? colors;      // Add this for color options
  final String description;        // Add this for product description
  final List<String> categories;   // For category filtering
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
}