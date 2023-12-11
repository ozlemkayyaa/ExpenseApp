import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, travel, food, dress }

const categoryIcons = {
  Category.work: Icons.work_outline_outlined,
  Category.travel: Icons.place_outlined,
  Category.dress: Icons.checkroom_outlined,
  Category.food: Icons.food_bank_outlined,
};

class Expense {
  Expense(
      {required this.name,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;
}

class CategoryExpenses {
  const CategoryExpenses({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  double get totalCategoryPrice {
    double sum = 0;

    for (int i = 0; i < expenses.length; i++) {
      sum += expenses[i].price;
    }
    return sum;
  }
}
