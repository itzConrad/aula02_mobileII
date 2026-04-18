import '../../models/product.dart';
import '../datasources/remote_data_source.dart';
import '../datasources/local_data_source.dart';

class ProductRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ProductRepository({required this.remoteDataSource, required this.localDataSource});

  Future<List<Product>> getProducts() async {
    try {
      // 1. Tenta buscar da internet
      final products = await remoteDataSource.fetchFromApi();
      // 2. Se der certo, salva no cache
      await localDataSource.saveCache(products);
      return products;
    } catch (e) {
      // 3. Se a API falhar, tenta buscar do cache local
      try {
        return await localDataSource.getCachedProducts();
      } catch (cacheError) {
        // 4. Se não tiver internet E o cache estiver vazio, lança o erro para a tela
        throw Exception('Sem conexão com a internet e sem dados locais.');
      }
    }
  }
}