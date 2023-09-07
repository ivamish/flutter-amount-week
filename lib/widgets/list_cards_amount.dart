import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "./card_amount.dart";
import "../models/transaction.dart";

class ListCardsAmount extends StatefulWidget {
  List<Transaction> transactions;
  ListCardsAmount(this.transactions, {super.key});

  @override
  State<ListCardsAmount> createState() => _ListCardsAmount(transactions);
}



class _ListCardsAmount extends State<ListCardsAmount> {
  List<Transaction> transactions;

  _ListCardsAmount(this.transactions);


  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
