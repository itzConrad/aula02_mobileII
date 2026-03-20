import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/todos/presentation/viewmodels/product_viewmodel.dart';
import 'features/todos/presentation/pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(), // Inicia pela tela inicial agora
      ),
    ),
  );
}