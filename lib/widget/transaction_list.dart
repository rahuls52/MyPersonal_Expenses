import 'package:flutter/material.dart';
import 'package:my_personal_expense/model/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Transaction added yet..!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                Container(
                  
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                )),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Rs ' +
                                transaction[index].amount.toStringAsFixed(2),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transaction[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              DateFormat().format(transaction[index].date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: transaction.length,
              ));
  }
}
