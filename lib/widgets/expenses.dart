import 'package:expsense_tracker/models/expense_model.dart';
import 'package:expsense_tracker/widgets/expenses_list.dart';
import 'package:expsense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

// widget class
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

// state class
class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  // void addExpense() {
  //   setState(() {
  //     _registeredExpenses.add(Expense(
  //         title: 'Food',
  //         amount: 29.99,
  //         date: DateTime.now(),
  //         category: Category.food));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            tooltip: 'Add expense',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        toolbarHeight: 45,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text("The chart"),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
