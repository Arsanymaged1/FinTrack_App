import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/expense_model.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Expense>> _expenses;

  @override
  void initState() {
    super.initState();
    _expenses = DatabaseHelper().getExpenses();
  }

  void _refreshExpenses() {
    setState(() {
      _expenses = DatabaseHelper().getExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FinTrack'),
        backgroundColor: const Color(0xFF1D3557),
      ),
      body: FutureBuilder<List<Expense>>(
        future: _expenses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final expenses = snapshot.data!;
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                title: Text(expense.description,
                    style: const TextStyle(fontSize: 18)),
                subtitle: Text('Category: ${expense.category}'),
                trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1D3557),
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );
          _refreshExpenses();
        },
      ),
    );
  }
}
