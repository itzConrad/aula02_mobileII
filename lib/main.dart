import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importações baseadas na sua estrutura de pastas do print
import 'features/todos/presentation/viewmodels/todo_viewmodel.dart';
import 'features/todos/presentation/viewmodels/product_viewmodel.dart';
import 'features/todos/presentation/pages/product_list_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // Define a tela de produtos como a tela inicial
        home: ProductListPage(),
      ),
    ),
  );
}