import 'package:flutter/material.dart';
import 'package:zack_shoping/view/favorite.dart';
import 'package:zack_shoping/widgets/product_class.dart';

class BottomBar extends StatefulWidget {
  final List<int> favorites;
  final List<Product> products;
  final VoidCallback onCartTapped;

  const BottomBar({
    super.key,
    required this.favorites,
    required this.products,
    required this.onCartTapped,
  });

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 0) {
      // Home tab tapped, do nothing as it is the current screen
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoriteScreen(
            favorites: widget.favorites,
            products: widget.products,
          ),
        ),
      );
    } else if (index == 2) {
      widget.onCartTapped();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow, // Set the background color here
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure this is set
        selectedItemColor: Colors.red, // Change selected item color
        unselectedItemColor: Colors.grey, // Change unselected item color
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
