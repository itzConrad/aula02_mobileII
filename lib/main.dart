import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home_screen.dart';
import 'data/datasources/local_data_source.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/product_repository.dart';
import 'presentation/viewmodels/product_viewmodel.dart';
import 'presentation/screens/product_list_screen.dart';

void main() {
  // 1. Inicializar as fontes de dados (DataSources)
  final localDataSource = LocalDataSource();
  final remoteDataSource = RemoteDataSource();

  // 2. Inicializar o repositório injetando os DataSources
  final productRepository = ProductRepository(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );

  runApp(
    // 3. Injetar o ViewModel na árvore da aplicação para que os ecrãs o possam "escutar"
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(repository: productRepository),
        ),
      ],
      child: const MeuApp(),
    ),
  );
}

// ... (mantenha os imports e o MultiProvider no main)

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Produtos - MVVM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Mude de ProductListScreen() para HomeScreen()
      home: const HomeScreen(), 
      debugShowCheckedModeBanner: false,
    );
  }
}