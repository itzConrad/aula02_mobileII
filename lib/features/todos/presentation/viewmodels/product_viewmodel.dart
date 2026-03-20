import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductViewModel extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Notebook Pro',
      price: 4500.0,
      description: 'Um notebook potente para trabalho e jogos.',
      imageUrl: 'https://picsum.photos/id/1/400/300',
    ),
    Product(
      id: 2,
      name: 'Mouse Gamer',
      price: 150.0,
      description: 'Sensor de alta precisão e luzes RGB.',
      imageUrl: 'https://picsum.photos/id/2/400/300',
    ),
  ];

  List<Product> get products => _products;
}