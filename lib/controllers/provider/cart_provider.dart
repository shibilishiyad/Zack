import 'package:flutter/material.dart';
import 'package:zack_shoping/widgets/cart_itemclass.dart';
import 'package:zack_shoping/widgets/product_class.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product, {String size = 'M'}) {
    final index = _cartItems.indexWhere((item) => item.product == product);
    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product, size: size));
    }
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double calculateSubtotal() {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}
