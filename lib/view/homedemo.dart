// ignore_for_file: avoid_unnecessary_containers



import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:zack_shoping/utils/storage.dart';
import 'package:zack_shoping/view/cart_page.dart';
import 'package:zack_shoping/view/favorite.dart';

import 'package:zack_shoping/view/product_dtl.dart';
import 'package:zack_shoping/widgets/cart_itemclass.dart';
import 'package:zack_shoping/widgets/product_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(
      name: 'Cap Sleeves',
      description: 'V-Neck A-line fit Two pockets Linen blend ',
      price: 255.99,
      imagePaths: [
        'image/product/product1.png',
        'image/product/product1.1.jpg',
        'image/product/product1.3.jpg'
      ],
      id: 'product1',
    ),
    Product(
      name: 'Vero Moda',
      description: 'Women Polyester%100 Fit and Flare Solid Brown',
      price: 255.99,
      imagePaths: [
        'image/product/product2.png',
        'image/product/product2.2.jpg',
        'image/product/product2.3.jpg'
      ],
      id: 'product2',
    ),
    Product(
      name: 'summer staple',
      description: 'his shirt features a charming collar neckline ',
      price: 255.99,
      imagePaths: [
        'image/product/product3.png',
        'image/product/product3.2.jpg',
        'image/product/product3.3.jpg'
      ],
      id: 'product3',
    ),
    Product(
      name: 'women shirt',
      description: 'Long Sleeves Notched Lapel Regular Regular Fit ',
      price: 255.99,
      imagePaths: [
        'image/product/product4.png',
        'image/product/product4.2.jpg',
        'image/product/product4.3.jpg'
      ],
      id: 'product4',
    ),
    Product(
      name: 'Campus Sutra',
      description: 'Long Coat for Winter Wear Collar Neck Full Sleeve',
      price: 255.99,
      imagePaths: [
        'image/product/product5.png',
        'image/product/product5.2.jpg',
        'image/product/product5.3.jpg'
      ],
      id: 'product5',
    ),
    Product(
      name: 'KOTTY Women',
      description: 'Single Breasted Relaxed Fit Mandarin Collar ',
      price: 255.99,
      imagePaths: [
        'image/product/product6.png',
        'image/product/product6.2.jpg',
        'image/product/product6.3.jpg'
      ],
      id: 'product6',
    ),
    Product(
      name: 'Kurta',
      description: 'Ban Collar | Pants: Ankle length Kurta: 3/4th ',
      price: 255.99,
      imagePaths: [
        'image/product/product7.png',
        'image/product/product7.2.jpg',
        'image/product/product7.3.jpg'
      ],
      id: 'product7',
    ),
    Product(
      name: 'Sweatshirt',
      description: 'ADBUCKS Womens Solid Cotton Hooded Sweatshirt',
      price: 255.99,
      imagePaths: [
        'image/product/product8.png',
        'image/product/product8.2.jpg',
        'image/product/product8.3.jpg'
      ],
      id: 'product8',
    ),
    Product(
      name: 'Sheetal Associates',
      description: 'Women Casual Regular Sleeves Crepe Solid Fit',
      price: 255.99,
      imagePaths: [
        'image/product/product9.png',
        'image/product/product9.2.jpg',
        'image/product/product9.3.jpg'
      ],
      id: 'product9',
    ),
    Product(
      name: 'Vero Moda',
      description: 'Single Breasted Relaxed Fit Mandarin Collar',
      price: 255.99,
      imagePaths: [
        'image/product/product10.png',
        'image/product/product10.2.jpg',
        'image/product/product10.3.jpg'
      ],
      id: 'product10',
    ),
  ];

  List<int> favorites = [];
  List<CartItem> cartItems = []; // Initialize an empty cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          ' ZACK',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'image/zackwear.png',
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  child: const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 20, left: 0),
                      child: Icon(
                        Icons.person,
                        size: 35,
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 20, right: 0),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Icon(
                      Icons.badge,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(top: 35, left: 10),
                    child: Text(
                      'Orders',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/settings'); // Navigating to settings screen
                  },
                  child: const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 35, left: 10),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await storage.deleteAll();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/first');
                  },
                  child: const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 35, left: 10),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        favorites: favorites,
        products: products,
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
              Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 8, left: 8),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                  ),
                  items: [
                    Container(
                      child: Image.asset('image/ADDD6.jpg'),
                    ),
                    Container(
                      child: Image.asset('image/ADDD2.jpg'),
                    ),
                    Container(
                      child: Image.asset('image/ADDD3.jpg'),
                    ),
                    Container(
                      child: Image.asset('image/ADDD5.jpg'),
                    ),
                  ],
                ),
              ),

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
              const SizedBox(
                height: 30,
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
              //   child: Text(
              //     'TOP PICKS FOR YOU',
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
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
                                      image: AssetImage(product.imagePaths[0]),
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
                                          isFavorite ? Colors.red : Colors.grey,
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
  // ignore: library_private_types_in_public_api
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
    return BottomNavigationBar(
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
    );
  }
}
