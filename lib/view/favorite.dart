import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/provider/cart_provider.dart';
import 'package:zack_shoping/controllers/provider/fav_provider.dart';
import 'package:zack_shoping/view/product_dtl.dart';
import 'package:zack_shoping/widgets/product_class.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final favoriteProvider = context.watch<FavoriteProvider>();

   
    final favoriteProducts = favoriteProvider.favoriteProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Favorite Items'),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
              child: Text(
                'No favorite items yet!',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 0.7,
                crossAxisCount: 2,
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
                          onAddToCart: (cartItem) {
                            context.read<CartProvider>().addToCart(cartItem as Product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Added to cart!')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.black87,
                    elevation: 3,
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product.imagePaths[0], // Show the first image
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Product Name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Product Price
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '₹${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // Favorite and Cart Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: favoriteProvider.isFavorited(product)
                                    ? Colors.white70
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                favoriteProvider.toggleFavorite(product);
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                context.read<CartProvider>().addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added to cart!')),
                                );
                              },
                            ),
                          ],
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
