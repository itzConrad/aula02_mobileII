import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductController extends ChangeNotifier {
  final ProductService _productService = ProductService();

  List<Product> products = [];
  bool isLoading = false;

  ProductController() {
    loadProducts(); // Carrega os produtos assim que o app iniciar
  }

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners(); // Avisa a tela para mostrar a "bolinha" girando

    try {
      products = await _productService.fetchProducts();
    } catch (e) {
      print('Erro ao carregar produtos: $e');
    } finally {
      isLoading = false;
      notifyListeners(); // Avisa a tela para atualizar a lista
    }
  }

  Future<void> saveProduct(Product product) async {
    isLoading = true;
    notifyListeners();

    try {
      if (product.id == null) {
        await _productService.addProduct(product);
      } else {
        await _productService.updateProduct(product);
      }
      await loadProducts(); // Recarrega a lista atualizada
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> removeProduct(String id) async {
    isLoading = true;
    notifyListeners();

    try {
      await _productService.deleteProduct(id);
      await loadProducts(); // Recarrega a lista após exclusão
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}