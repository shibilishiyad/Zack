import 'package:flutter/material.dart';

import '../../widgets/product_class.dart';

class FavoriteProvider extends ChangeNotifier {
  // List to track favorite products
  final List<Product> _favorites = [];

  // Getter for the list of favorite products
  List<Product> get favoriteProducts => _favorites;

  // Check if a product is favorited
  bool isFavorited(Product product) {
    return _favorites.contains(product);
  }

  // Toggle favorite state
  void toggleFavorite(Product product) {
    if (isFavorited(product)) {
      _favorites.remove(product); // Remove from favorites
    } else {
      _favorites.add(product); // Add to favorites
    }
    notifyListeners(); // Notify listeners to rebuild UI
  }
}
