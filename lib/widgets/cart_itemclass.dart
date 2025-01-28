import 'package:zack_shoping/widgets/product_class.dart';

class CartItem {
  final Product product;
  int quantity; 
  final String size;

  CartItem({required this.product, this.quantity = 1, required this.size});
}
