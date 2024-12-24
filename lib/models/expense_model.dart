class Expense {
  final int? id;
  final String category;
  final String description;
  final double amount;

  Expense(
      {this.id,
      required this.category,
      required this.description,
      required this.amount});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'description': description,
      'amount': amount,
    };
  }
}
