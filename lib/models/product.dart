class Product {
  final String title;
  final String image;
  final List<String> categories; // Change from String to List<String>
  final String description;
  final double price;

  Product({
    required this.title,
    required this.image,
    required this.categories,
    required this.description,
    required this.price,
  });
}