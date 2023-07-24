// describe data structure of an expense
// This is a blueprint ready to be reused across the application
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter =
    DateFormat.yMd(); // ymd is date format, whcih we store in a variable

const uuid = Uuid();

// A list of predefined values a user can enter, to avoid issue with mis
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.date,
      required this.title,
      required this.amount,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // a Getter is useful to transform existing field within a CLASS
  String get formattedDate {
    return formatter.format(date);
  }

  @override
  String toString() {
    return 'Expense(title: $title, amount: $amount, date: $date, category: $category)';
  }
}

// ExpenseBucket is for showing our graph data, which adds up all expenses of each category
class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  // 2nd constructor responsible for filtering per category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; // sum  = sum + expense.amount;
    }
    return sum;
  }
}
