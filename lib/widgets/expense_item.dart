import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(expense.name, style: const TextStyle(color: Colors.white)),
          Row(
            children: [
              Text("₺ ${expense.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.white)), // string interpolation
              const Spacer(),
              Icon(categoryIcons[expense.category], color: Colors.white),
              const SizedBox(width: 6),
              Text(DateFormat.yMd().format(expense.date),
                  style: const TextStyle(color: Colors.white)),
            ],
          )
        ]),
      ),
    );
  }
}
