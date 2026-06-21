import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  // Dummy Data: Minimal 5 Produk
  final List<Product> products = [
    Product(id: '1', name: 'Xiaomi 14T Pro', price: 9999000),
    Product(id: '2', name: 'Xiaomi Redmi Note 13 Pro+', price: 4999000),
    Product(id: '3', name: 'Xiaomi Pad 6', price: 6499000),
    Product(id: '4', name: 'Xiaomi Smart Band 8', price: 599000),
    Product(id: '5', name: 'Xiaomi 33W Power Bank 10000mAh', price: 249000),
  ];

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Elektronik'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          // Menggunakan BlocBuilder untuk memantau jumlah item secara real-time
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                  ),
                  if (state.totalItems > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${state.totalItems}',
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Rp ${product.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                onPressed: () {
                  // Memicu fungsi addToCart dari Cubit
                  context.read<CartCubit>().addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} ditambahkan ke keranjang!'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }
}