// product_model.dart//newarrival 
class Product {
  final String name;
  final String description;
  final double price;
  final List<String> imagePaths; // Make sure this matches your needs
  final int id; // Assuming id is a required field

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePaths,
    required this.id,
  });

  
}

//sporty

// product_model.dart
class SpProduct {
  final String name;
  final String description;
  final double price;
  final List<String> imagePaths; // Make sure this matches your needs
  final String id; // Assuming id is a required field

  SpProduct({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePaths,
    required this.id,
  });
}

