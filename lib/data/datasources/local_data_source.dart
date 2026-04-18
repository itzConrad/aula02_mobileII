import '../../models/product.dart';

class LocalDataSource {
  // Simula um armazenamento local simples na memória (Cache)
  List<Product> _cache = [];

  Future<void> saveCache(List<Product> products) async {
    _cache = List.from(products);
  }

  Future<List<Product>> getCachedProducts() async {
    if (_cache.isEmpty) {
      throw Exception('Nenhum dado no cache local.');
    }
    return _cache;
  }
}