import "package:flutter/material.dart";
import "./card_amount.dart";
import "../models/transaction.dart";

class ListCardsAmount extends StatelessWidget {

  List<Transaction>transactions;

  ListCardsAmount(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CardAmount(
              title: transactions[index].title,
              amount: transactions[index].amount.toString(),
              date: transactions[index].date.toString());
        },
        itemCount: transactions.length,
      ),
    );
  }
}
