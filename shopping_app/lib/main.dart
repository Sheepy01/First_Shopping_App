import 'package:first_shopping_app/providers/cart_provider.dart';
import 'package:first_shopping_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          title: "Shopping App",
          theme: ThemeData(
            fontFamily: "Lato",
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 0, 119),
              primary: const Color.fromARGB(255, 239, 56, 141),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Colors.black45,
            ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              titleLarge: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          home: const HomePage()),
    );
  }
}
