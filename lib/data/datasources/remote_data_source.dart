import '../../models/product.dart';

class RemoteDataSource {
  Future<List<Product>> fetchFromApi() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula requisição
    
    // Descomente a linha abaixo para simular um ERRO na API e testar o Cache
    // throw Exception('Erro 500: Falha no Servidor'); 

    return [
      Product(id: '1', name: 'Camiseta', price: 50.0, description: 'Algodão', imageUrl: ''),
      Product(id: '2', name: 'Caneca', price: 30.0, description: 'Cerâmica', imageUrl: ''),
    ];
  }
}