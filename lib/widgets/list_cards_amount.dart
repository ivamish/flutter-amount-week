import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "./card_amount.dart";
import "../models/transaction.dart";

class ListCardsAmount extends StatelessWidget {
  List<Transaction> transactions;

  ListCardsAmount(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 200,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text( "\$${transactions[index].amount.toString()}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                  subtitle: Text(DateFormat('yyyy-MM-dd').format(transactions[index].date), style: const TextStyle(color: Colors.grey),),

                ),
              ),
            ),
          );
          //);
          // return CardAmount(
          //     title: transactions[index].title,
          //     amount: transactions[index].amount.toString(),
          //     date: transactions[index].date.toString());
        },
        itemCount: transactions.length,
      ),
    );
  }
}
