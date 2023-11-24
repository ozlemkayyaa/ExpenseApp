import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = ColorScheme.fromSeed(seedColor: Colors.purpleAccent);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          appBarTheme: AppBarTheme(
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
              backgroundColor: colorScheme1.onPrimaryContainer,
              foregroundColor: colorScheme1.primaryContainer),
          cardTheme: CardTheme(
            color: colorScheme1.onPrimaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                bodyMedium: const TextStyle(),
              )),
      home: const MainPage(),
    ),
  );
}
