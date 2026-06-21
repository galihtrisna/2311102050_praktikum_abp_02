import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  // State awal berupa list kosong
  CartCubit() : super(CartState(cartItems: []));

  // Menambah produk ke keranjang
  void addToCart(Product product) {
    final updatedList = List<Product>.from(state.cartItems)..add(product);
    emit(CartState(cartItems: updatedList));
  }

  // Menghapus produk dari keranjang
  void removeFromCart(Product product) {
    final updatedList = List<Product>.from(state.cartItems)..remove(product);
    emit(CartState(cartItems: updatedList));
  }
}