import '../models/product.dart';

class CartState {
  final List<Product> cartItems;

  CartState({required this.cartItems});

  // Menghitung total barang di keranjang
  int get totalItems => cartItems.length;
}