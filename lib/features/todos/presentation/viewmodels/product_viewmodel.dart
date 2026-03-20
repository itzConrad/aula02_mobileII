import 'package:flutter/material.dart';
// Note que ele sobe dois níveis para chegar em domain
import '../../domain/entities/product.dart'; 

class ProductViewModel extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Notebook', price: 3500.0),
    Product(name: 'Mouse', price: 120.0),
    Product(name: 'Teclado', price: 250.0),
    Product(name: 'Monitor', price: 900.0),
  ];

  List<Product> get products => _products;

  void toggleFavorite(Product product) {
    product.favorite = !product.favorite;
    notifyListeners();
  }

  int get favoriteCount => _products.where((p) => p.favorite).length;
}