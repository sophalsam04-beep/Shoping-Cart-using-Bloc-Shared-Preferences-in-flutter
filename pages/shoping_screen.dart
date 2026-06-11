import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:self_learning1/bloc/cart_bloc.dart';
import 'package:self_learning1/bloc/cart_event.dart';
import 'package:self_learning1/bloc/cart_state.dart';
import 'package:self_learning1/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';

class ShopingScreen extends StatelessWidget {
  ShopingScreen({super.key});

  final List<Product> products = [
    Product(id: 101, name: "iPhone 16", price: 500),
    Product(id: 102, name: "iPhone 17", price: 800),
    Product(id: 103, name: "iPad Mini Pro", price: 600),
    Product(id: 104, name: "MacBook Pro 2018", price: 700),
    Product(id: 105, name: "MacBook Pro 2015", price: 700),
    Product(id: 106, name: "MacBook M1", price: 900),
    Product(id: 107, name: "MacBook M2", price: 1100),
    Product(id: 108, name: "MacBook M3", price: 1430),
    Product(id: 109, name: "MacBook M4", price: 900),
    Product(id: 110, name: "Asus Vivo Book", price: 500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shoping Cart",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "${state.products.length}",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            title: Text(product.name, style: TextStyle(fontSize: 20)),
            subtitle: Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 19),
            ),

            trailing: IconButton(
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
              },
              icon: Icon(Icons.punch_clock_sharp, size: 30),
            ),
            contentPadding: EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}
