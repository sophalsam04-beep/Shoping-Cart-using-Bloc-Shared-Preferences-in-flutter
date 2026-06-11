import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import 'package:self_learning1/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(products: [])) {
    on<LoadCart>(_loadCart);
    on<AddProduct>(_addProduct);
    on<RemoveProduct>(_removeProduct);
  }

  Future<void> _loadCart( LoadCart event , Emitter<CartState> emit)async{
      
      // shared preferences
      final prefs = await SharedPreferences.getInstance();

      // list of data
      List<String> cartData = prefs.getStringList('cart') ?? [];

      List<Product> products = cartData.map((e)=> Product.fromJson(jsonDecode(e))).toList();

      emit(CartState(products: products));
  }

  Future<void> _addProduct(AddProduct event, Emitter<CartState> emit)async{

          List<Product> update = List.from(state.products)..add(event.products);

          await _saveCart(update);

          emit(CartState(products: update));
       }


       Future<void> _removeProduct(RemoveProduct event, Emitter<CartState> emit) async{
            List<Product> update = List.from(state.products)..remove(event.products);

            emit(CartState(products: update));

            await _saveCart(update);



       }


         Future<void> _saveCart(List<Product> products)async{
              final prefs = await SharedPreferences.getInstance();
              List<String> data = products.map((e)=> jsonEncode(e.toJson())).toList();

              await prefs.setStringList('cart', data);
         }
}