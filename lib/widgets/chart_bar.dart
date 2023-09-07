import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double amount;
  final double precentOfTotal;

  Bar(
      {super.key,
      required this.label,
      required this.amount,
      required this.precentOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text("\$${amount.toStringAsFixed(0)}"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: 20,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary, width: 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: precentOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1),
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primary),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
