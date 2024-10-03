import 'package:flutter/material.dart';
import 'package:zack_shoping/widgets/cart_itemclass.dart';
import 'package:zack_shoping/widgets/product_class.dart';

import 'cart_page.dart'; // Import the CartPage

class ProductDetailPage extends StatefulWidget {
  final Product product;
  final Function(CartItem) onAddToCart;
  final Function(bool) onFavorite;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onFavorite,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<CartItem> cartItems = []; // Initialize an empty cart

  void _slideLeft() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _slideRight() {
    if (_currentIndex < widget.product.imagePaths.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void addToCart(Product product) {
    final cartItem = CartItem(product: product);
    setState(() {
      cartItems.add(cartItem);
    });
    widget.onAddToCart(cartItem);
  }

  void changeImage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(widget.product.name),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            height: 450,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.product.imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      widget.product.imagePaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_left,
                        size: 40, color: Colors.black),
                    onPressed: _slideLeft,
                  ),
                ),
                Positioned(
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_right,
                        size: 40, color: Colors.black),
                    onPressed: _slideRight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.product.imagePaths.length, (index) {
              return GestureDetector(
                onTap: () => changeImage(index),
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _currentIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Image.asset(
                    widget.product.imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 40),
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.product.description,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            '\$${widget.product.price}',
            style: const TextStyle(fontSize: 20, color: Colors.green),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Add to wishlist logic
                      widget.onFavorite(true);
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'WISHLIST',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.white),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      addToCart(widget.product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(cartItems: cartItems),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'ADD TO BAG',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
