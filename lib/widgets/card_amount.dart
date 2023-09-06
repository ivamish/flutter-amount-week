import "package:flutter/material.dart";
import "package:intl/intl.dart";

class CardAmount extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  CardAmount(
      {super.key,
      required this.title,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            child: Text(
              "\$$amount",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('yyyy.MM.dd').format(DateTime.parse(date)),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
