import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> transactions;
  Chart(this.transactions, {super.key});

  List<Map<String,Object>> get infoTransactionsWeek {
    return List.generate(7, (index){

      double totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var formatter = DateFormat(('E'));

      for(int i = 0; i <= transactions.length-1; i++){

        if( transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.day == weekDay.day ) {
          totalSum += transactions[i].amount;
        }

      }

      return {
        'day' : formatter.format(weekDay),
        'amount' : totalSum
      };
    });
  }

  double get totalSummary {
    return infoTransactionsWeek.fold(0.0, (previousValue, element) {
      return previousValue += (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...(infoTransactionsWeek).map((el){
              return Flexible(
                fit: FlexFit.tight,
                child: Bar(label: (el['day'] as String), amount: (el['amount'] as double), precentOfTotal: (el['amount'] as double) / totalSummary),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
