import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/provider/fav_provider.dart';
import 'package:zack_shoping/view/bottombar.dart';
import 'package:zack_shoping/view/product_dtl.dart';
import 'package:zack_shoping/widgets/product_img.dart';
import 'package:zack_shoping/widgets/product_class.dart';

class ProductDisplayPage extends StatelessWidget {
  final String?
      category; 
      

  const ProductDisplayPage({super.key, this.category, required int index});

  @override
  Widget build(BuildContext context) {
    
    // Get the list of products based on category
    List<Product> selectedProducts;
    

    if (category == 'newarrival') {
      selectedProducts = NewProductImg
          .products; // Assuming NewProductImg has a 'products' list
    } else {
      selectedProducts = SportyProduct
          .spProduct; // Assuming SportyProduct has a 'products' list
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$category Product Display'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                        MainBottombar(initialIndex: 1,),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 5.0, // Spacing between columns
            mainAxisSpacing: 2.0, // Spacing between rows
            childAspectRatio:
                0.6, 
          ),
          itemCount: selectedProducts.length, 
          itemBuilder: (context, index) {
            var selectedProduct =
                selectedProducts[index]; 
            return InkWell(
              onTap: () {
                  // context.read<FavoriteProvider>().setSelectedProduct(selectedProduct); //save selected product in the provider
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProductDetailPage(
        product: selectedProduct,
        onAddToCart: (cartItem) {
          // Handle add to cart functionality if needed
        },
       
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
},

              child: Card(
                color: Colors.white54,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Stack(
                        children: [
                          Image.asset(
                          selectedProduct.imagePaths[
                              0], // Get the first image from the list of imagePaths
                          height: 230, // Adjust image size as needed
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        IconButton(
  icon: Icon(
    context.watch<FavoriteProvider>().isFavorited(selectedProduct )
        ? Icons.favorite
        : Icons.favorite_border_outlined,
    size: 30,
  ),
  color: context.watch<FavoriteProvider>().isFavorited(selectedProduct )
      ? Colors.white
      : Colors.white,
  onPressed: () {
    context.read<FavoriteProvider>().toggleFavorite(selectedProduct );
     ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added to Favorites')),
                              );
  },
),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        selectedProduct.name, // Access the 'name' property
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        selectedProduct
                            .description, // Access the 'description' property
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}





