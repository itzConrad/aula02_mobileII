import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../data/repositories/product_repository.dart';

// Definindo explicitamente os estados exigidos na atividade
enum AppState { loading, success, error }

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;

  ProductViewModel({required this.repository});

  AppState state = AppState.loading;
  List<Product> products = [];
  String errorMessage = '';

  Future<void> fetchProducts() async {
    state = AppState.loading;
    notifyListeners();

    try {
      products = await repository.getProducts();
      state = AppState.success;
    } catch (e) {
      errorMessage = e.toString();
      state = AppState.error;
    } finally {
      notifyListeners();
    }
  }
  // Adicione este método dentro da classe ProductViewModel
  Future<void> saveProduct(Product product) async {
    state = AppState.loading;
    notifyListeners();

    try {
      // Simulando o tempo de salvamento na API
      await Future.delayed(const Duration(seconds: 1)); 
      
      if (product.id == null) {
        // Se não tem ID, é um produto novo. Adiciona na lista.
        final newProduct = Product(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: product.name,
          price: product.price,
          description: product.description,
          imageUrl: product.imageUrl,
        );
        products.add(newProduct);
      } else {
        // Se tem ID, é uma edição. Atualiza na lista.
        final index = products.indexWhere((p) => p.id == product.id);
        if (index != -1) {
          products[index] = product;
        }
      }
      state = AppState.success;
    } catch (e) {
      errorMessage = 'Erro ao salvar produto';
      state = AppState.error;
    } finally {
      notifyListeners();
    }
  }
}
