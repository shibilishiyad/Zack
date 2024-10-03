// ignore: file_names
import 'package:flutter/material.dart';
import 'package:zack_shoping/view/product_dtl.dart';
import 'package:zack_shoping/widgets/product_class.dart';


class FavoriteScreen extends StatelessWidget {
  final List<int> favorites;
  final List<Product> products;

  const FavoriteScreen({
    super.key,
    required this.favorites,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = favorites.map((index) => products[index]).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('Favorites'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    product: product,
                    onAddToCart: (cartItem) {},
                    onFavorite: (isFavorite) {},
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    product.imagePaths[0],
                    fit: BoxFit.cover,
                    height: 140,
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '₹${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
