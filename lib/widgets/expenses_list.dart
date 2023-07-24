import 'package:expsense_tracker/models/expense_model.dart';
import 'package:expsense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense)
      onRemoveExpense; // passing the function from expenses.dart

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.60),
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        }, // key is needed to unique identify our widgets
        child: ExpenseItem(expenses[index]),
      ),
    );
    // iterating over our expenses here
  }
}
