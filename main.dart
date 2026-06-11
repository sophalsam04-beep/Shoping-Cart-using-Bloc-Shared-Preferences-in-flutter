import 'package:flutter/material.dart';
import 'package:self_learning1/bloc/cart_bloc.dart';
import 'package:self_learning1/bloc/cart_event.dart';
import 'package:self_learning1/pages/shoping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    BlocProvider(
      create: (context) => CartBloc()..add(LoadCart()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopingScreen(),
    );
  }
}
