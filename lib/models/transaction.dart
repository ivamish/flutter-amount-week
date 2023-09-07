class Transaction {
  final String title;
  final double amount;
  final DateTime date;
  final String id;

  Transaction({required this.title, required this.date, required this.amount, required this.id});
}