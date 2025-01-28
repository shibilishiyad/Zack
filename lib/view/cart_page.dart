import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/provider/cart_provider.dart';
import 'package:zack_shoping/view/login.dart';
import 'package:zack_shoping/view/product_dtl.dart';
import 'package:zack_shoping/widgets/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final cartItems = cartProvider.cartItems;

    double subtotal = cartProvider.calculateSubtotal();
    double shippingFee = 4;
    double total = subtotal + shippingFee;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: cartItem.product, onAddToCart: (cartItem ) {  },
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.black87,
                      child: ListTile(
                        leading: Container(height: 100,width: 100,color: Colors.white,
                          child: Image.asset(
                            cartItem.product.imagePaths[0],
                            width: 60,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          cartItem.product.name,
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,color: Colors.white,),
                                  onPressed: () =>
                                      cartProvider.decreaseQuantity(index),
                                ),
                                Text('${cartItem.quantity}',style: TextStyle(color: Colors.white),),
                                IconButton(
                                  icon: const Icon(Icons.add,color: Colors.white,),
                                  onPressed: () =>
                                      cartProvider.increaseQuantity(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete,color: Colors.white70,),
                          onPressed: () => cartProvider.removeItem(index),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SummaryWidget(
            buttoncolor: Colors.black,
            subtotal: subtotal,
            shippingFee: shippingFee,
            total: total,
            showFullWidget: true,
            buttonText: 'Place Order',
            buttonwidth: screenWidth,
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginscreen(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 30,
      ),
    );
  }
}
