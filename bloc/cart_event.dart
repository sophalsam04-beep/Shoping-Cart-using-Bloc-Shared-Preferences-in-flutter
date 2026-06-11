import 'package:self_learning1/models/product.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable{
        @override

            List<Object?>get props => [];

}

class AddProduct extends CartEvent{
  final Product products;

  AddProduct(this.products);
      @override
        List<Object?> get props => [products];

}

class RemoveProduct extends CartEvent{
    final Product products;

    RemoveProduct(this.products);

     @override
         List<Object?> get props => [products]; 
}


class LoadCart extends CartEvent{}