import 'package:flutter/material.dart';
import './input.dart';

class FormAddAmount extends StatelessWidget {

  final TextEditingController nameControl;
  final TextEditingController amountControl;
  final Function callback;

  const FormAddAmount({super.key, required this.amountControl, required this.nameControl, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InputAmount(
                placeholder: 'Name',
                controller: nameControl,
              ),
              InputAmount(
                placeholder: 'Price',
                controller: amountControl,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: OutlinedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15))),
                  onPressed: () => callback(),
                  child: const Text('Add'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}