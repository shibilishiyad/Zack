import 'package:flutter/material.dart';
import 'package:zack_shoping/utils/storage.dart';
import 'package:zack_shoping/view/cart_page.dart';
import 'package:zack_shoping/view/homedemo.dart';
import 'package:zack_shoping/view/product_dtl.dart';
import 'package:zack_shoping/widgets/carousel_images.dart';
import 'package:zack_shoping/widgets/cart_itemclass.dart';
import 'package:zack_shoping/widgets/drawer.dart';
import 'package:zack_shoping/widgets/product_img.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> favorites = [];
  List<CartItem> cartItems = []; // Initialize an empty cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          'ZACK',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.white,
                  offset: Offset(2.0, 2.0),
                ),
              ],
              fontSize: 35),
        ),
      ),
      drawer: const CustomDrawer(storage: storage), // Drawer
      bottomNavigationBar: BottomBar(
        favorites: favorites,
        products: ProductImg.products, // Access products from ProductImg class
        onCartTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: cartItems),
            ),
          );
        },
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      style: const TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(147, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const CarouselWidget(), // Carousel_slider Widget
              const Center(
                child: Text(
                  'NEW COLLECTION',
                  style: TextStyle(
                      fontFamily: 'PoiretOne',
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          offset: Offset(2.1, 2.1),
                          blurRadius: 3.0,
                          color: Color.fromARGB(130, 0, 0, 0),
                        ),
                      ],
                      color: Color.fromARGB(255, 113, 111, 111),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: ProductImg
                    .products.length, // Use ProductImg.products length
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = ProductImg
                      .products[index]; // Access product from ProductImg
                  final isFavorite = favorites.contains(index);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: product,
                            onAddToCart: (CartItem item) {
                              setState(() {
                                cartItems.add(item);
                              });
                            },
                            onFavorite: (isFavorite) {},
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage(product.imagePaths[
                                          0]), // Use the product image
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isFavorite) {
                                          favorites.remove(index);
                                        } else {
                                          favorites.add(index);
                                        }
                                      });
                                    },
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          isFavorite ? Colors.red : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
