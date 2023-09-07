import 'package:check_armount/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

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
    Transaction(title: 'New hoe 2', date: DateTime.now().subtract(Duration(days: 1)), amount: 39.29, id: 'loh'),
    Transaction(title: 'New hoe 3', date: DateTime.now().subtract(Duration(days: 6)), amount: 49.29, id: 'loh2'),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element){
      return element.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }
  final nameControl = TextEditingController();
  final amountControl = TextEditingController();

  void deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  void startFormAddAmount(BuildContext ctx)
  {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext ctx2) {
          return FormAddAmount(
              amountControl: amountControl,
              nameControl: nameControl,
              callback: () {
                setState(() {
                  _transactions.add(Transaction(
                      title: nameControl.text,
                      date: DateTime.now(),
                      amount: double.parse(amountControl.text),
                      id: DateTime.now().toString()));
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
            Chart(_recentTransactions),
            const SizedBox(height: 30,),
            Container(
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
                                child: Text(
                                  "\$${_transactions[index].amount.toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            _transactions[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          subtitle: Text(
                            DateFormat('yyyy-MM-dd').format(_transactions[index].date),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.redAccent,), onPressed: () => deleteTransaction(_transactions[index].id),),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _transactions.length,
              ),
            )
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
