import 'package:check_armount/widgets/form.dart';
import 'package:check_armount/widgets/list_cards_amount.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AmountCheckPage(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        fontFamily: 'OpenSans'
      ),
    );
  }
}

class AmountCheckPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AmountCheckPage();
  }
}

class _AmountCheckPage extends State<AmountCheckPage> {

  final List<Transaction> _transactions = [

  ];
  final nameControl = TextEditingController();
  final amountControl = TextEditingController();

  void startFormAddAmount(BuildContext ctx)
  {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext ctx) {
          return FormAddAmount(
              amountControl: amountControl,
              nameControl: nameControl,
              callback: () {
                setState(() {
                  _transactions.add(Transaction(
                      title: nameControl.text,
                      date: DateTime.now(),
                      amount: double.parse(amountControl.text)));
                  nameControl.clear();
                  amountControl.clear();
                });
                Navigator.pop(context);
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amount App"),
        actions: [
          IconButton(onPressed: () => startFormAddAmount(context), icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: _transactions.isEmpty ? Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('U have no amounts yet((', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18), textAlign: TextAlign.center,),
              Container(
                width: 300,
                height: 300,
                child: const Image(image: AssetImage('assets/images/pngwing.com.png'), fit: BoxFit.cover,),
              )
            ],
          ),
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Card(
              color: Theme.of(context).colorScheme.primary,
              child: const Text('chart!'),
            ),
            ListCardsAmount(_transactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startFormAddAmount(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
