import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/provider/cart_provider.dart';
import 'package:zack_shoping/controllers/provider/fav_provider.dart';
import 'package:zack_shoping/widgets/cart_itemclass.dart';
import 'package:zack_shoping/widgets/product_class.dart';


class ProductDetailPage extends StatefulWidget {
  final Product product;
  final Function(CartItem) onAddToCart;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<CartItem> cartItems = []; // Initialize an empty cart
  String _selectedSize = ''; // Track size

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

 
  void changeImage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Widget _buildSizeButton(String size,
      {bool available = true, bool fewLeft = false}) {
    return GestureDetector(
      onTap: available
          ? () {
              setState(() {
                _selectedSize = size;
              });
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: !available
              ? Colors.grey[300]
              : (_selectedSize == size ? Colors.black : Colors.white),
          border: Border.all(
            color: !available
                ? Colors.grey
                : (_selectedSize == size ? Colors.black : Colors.grey),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (fewLeft && available)
              const Icon(Icons.circle, size: 10, color: Colors.red),
            if (fewLeft && available) const SizedBox(width: 6),
            Text(
              size,
              style: TextStyle(
                color: !available
                    ? Colors.grey
                    : (_selectedSize == size ? Colors.white : Colors.black),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.product.name),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            height: 380,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.product.imagePaths.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: double.infinity, //popup image
                              width: double.infinity,
                              color: Colors.white,
                              child: Center(
                                child: Image.asset(
                                  widget.product.imagePaths[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      onLongPressUp: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        widget.product.imagePaths[index],
                        fit: BoxFit.contain,
                      ),
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
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
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
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sizes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildSizeButton('S', available: true),
              _buildSizeButton('M', available: true),
              _buildSizeButton('L', available: true),
              _buildSizeButton('XL', available: true),
              _buildSizeButton('XXL', available: true),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context
                          .read<FavoriteProvider>()
                          .toggleFavorite(widget.product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to Favorites')),
                      );
                    },
                    icon: Icon(
                      context
                              .watch<FavoriteProvider>()
                              .isFavorited(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'WISHLIST',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
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
                      if (_selectedSize.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select a size before adding to cart'),
                          ),
                        );
                      } else {
                        context.read<CartProvider>().addToCart(widget.product);
                         ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added to cart!')),
                              );
                      }
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: const Text(
                      'ADD TO BAG',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
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
