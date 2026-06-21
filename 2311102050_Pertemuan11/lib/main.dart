import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cart_cubit.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi BlocProvider di level root agar state dapat diakses di semua screen
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        title: 'Flutter BLoC Cart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}