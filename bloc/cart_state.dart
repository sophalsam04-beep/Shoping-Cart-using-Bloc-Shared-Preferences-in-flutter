import 'package:self_learning1/models/product.dart';
import 'package:equatable/equatable.dart';


class CartState extends Equatable{
    final List<Product> products;

    const CartState({required this.products});

    @override
         List<Object?> get props => [products];
}